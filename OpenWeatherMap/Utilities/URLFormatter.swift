//
//  URLFormatter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

protocol URLFormatterProtocol {
    
    func getCityDetailsURL(longitude:Double, latitude:Double) -> String
}

class URLFormatter {
    
    func getCityDetailsURL(longitude:Double, latitude:Double) -> String {
                
        return "\(Constants.BASE_URL)lat=\(latitude)&lon=\(longitude)&appid=\(Constants.API_KEY)&units=\(Constants.DEFAULT_UNIT)"
    }
}
