//
//  URLFormatter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

class URLFormatter {
    
    static func getCityDetailsURL(longitude:Double, latitude:Double) -> String {
        
        //TODO:: Make it prettier.
        return "\(Constants.BASE_URL)lat=\(latitude)&lon=\(longitude)&appid=\(Constants.API_KEY)&units=\(Constants.DEFAULT_UNIT)"
    }
}
