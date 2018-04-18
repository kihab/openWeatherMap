//
//  OpenWeatherService.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

typealias CityDetailsCompletionBlock = (_ city:City) -> Void

class openWeatherService {
    
    class func getCityDetails(city:LocalCityModel, completionBlock: @escaping CityDetailsCompletionBlock) {
        
        let urlString = URLFormatter.getCityDetailsURL(longitude: city.coordinates.longitude, latitude: city.coordinates.latitude)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let city = try JSONDecoder().decode(City.self, from: data)
                completionBlock(city)
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
}
