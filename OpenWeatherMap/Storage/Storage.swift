//
//  Storage.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//
import UIKit

protocol StorageProtocol {
    
    func store(localCity city:LocalCityModel)
    func remove(localCity city:LocalCityModel)
    func getStoredCities() -> [LocalCityModel]?
}
class Storage: StorageProtocol {
    
    let defaults = UserDefaults.standard
    
    func store(localCity city: LocalCityModel) {
        
        var citiesList = [LocalCityModel]()
        if let cities = getStoredCities() {
            citiesList = cities
        }
        
        if citiesList.contains(where: { $0.name == city.name }) {
            return
        } else {
            citiesList.append(city)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(citiesList), forKey: Constants.CITIES_LIST)
        }

    }
    
    func remove(localCity city:LocalCityModel) {
        
        //TODO:: Implement Remove City
    }
    
    func getStoredCities() -> [LocalCityModel]? {
        
        if let citiesData = defaults.value(forKey: Constants.CITIES_LIST) as? Data {
            let cities = try? PropertyListDecoder().decode(Array<LocalCityModel>.self, from: citiesData)
            return cities
        }
      
        return nil
    }
}
