//
//  OpenWeatherModels.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//


//TODO::Either Rename the two cities object or make it prettier.
//I think it shouldn't be named city, not even an object - see after soting locally NSUserDefaults.

// MARK: Models used to store city details locally
struct LocalCityModel {
    let name: String
    let coordinates: Coordinates
}

struct Coordinates {
    let longitude: Double
    let latitude: Double
    
}

// MARK: Models used to parse city details from the server
struct City: Decodable {
    let name: String
    let id: Int
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let rain: Rain?
}

struct Weather: Decodable {
    let main: String
    let description: String
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Decodable {
    let speed: Float
    let deg: Int
}

struct Rain: Decodable {
    let volume: Int
    
    private enum CodingKeys : String, CodingKey {
        case volume = "3h"
    }
}

