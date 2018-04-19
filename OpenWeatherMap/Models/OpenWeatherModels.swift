//
//  OpenWeatherModels.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

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
    let deg: Int?
}

struct Rain: Decodable {    
    let volume: Int
    
    private enum CodingKeys : String, CodingKey {
        case volume = "3h"
    }
}

