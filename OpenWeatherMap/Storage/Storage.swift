//
//  Storage.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//
import UIKit

protocol StorageProtocol {
    
    static func store(localCity city:LocalCityModel)
    static func remove(localCity city:LocalCityModel)
    static func getStoredCities() -> [LocalCityModel]?
}
class Storage: StorageProtocol {
    
    static let defaults = UserDefaults.standard
    
    static func store(localCity city: LocalCityModel) {
        
        var citiesList = [LocalCityModel]()
        if let cities = getStoredCities() {
            citiesList = cities
        }
        
        citiesList.append(city)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(citiesList), forKey: Constants.CITIES_LIST)
    }
    
    static func remove(localCity city:LocalCityModel) {
        
        //TODO:: Remove City
    }
    
    static func getStoredCities() -> [LocalCityModel]? {
        
        if let citiesData = defaults.value(forKey: Constants.CITIES_LIST) as? Data {
            let cities = try? PropertyListDecoder().decode(Array<LocalCityModel>.self, from: citiesData)
            return cities
        }
      
        return nil
    }
}
