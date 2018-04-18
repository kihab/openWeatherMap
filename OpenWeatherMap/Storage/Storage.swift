//
//  Storage.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

protocol storageProtocol {
    
    static func store(localCity city:LocalCityModel)
    static func getStoredCities() -> [LocalCityModel]?
}
class Storage: storageProtocol {
    
    static func store(localCity city: LocalCityModel) {
        
        //Store City Locally
    }
    
    static func getStoredCities() -> [LocalCityModel]? {
        
        var cities = [LocalCityModel]()
        let coor1 = Coordinates(longitude: -0.13, latitude: 51.51)
        let city1 = LocalCityModel(name: "London", coordinates: coor1)
        let city2 = LocalCityModel(name: "Cairo", coordinates: coor1)
        let city3 = LocalCityModel(name: "Berlin", coordinates: coor1)
        cities.append(city1)
        cities.append(city2)
        cities.append(city3)
        
        //Get Local Stored Cities if any
        
        return cities
    }
}
