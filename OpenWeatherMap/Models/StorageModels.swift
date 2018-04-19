//
//  StorageModels.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

// MARK: Used to store city details locally

struct LocalCityModel: Codable {
    
    let name: String
    let longitude: Double
    let latitude: Double
}
