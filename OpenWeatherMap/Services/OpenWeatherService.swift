//
//  OpenWeatherService.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

typealias CityDetailsCompletionBlock = (_ city:City?, _ error:Error?) -> Void

protocol OpenWeatherServiceProtocol {
    
    func getDetails(forCoordinates coordinates:Coordinates, completionBlock: @escaping CityDetailsCompletionBlock)
}

class OpenWeatherService:  OpenWeatherServiceProtocol {
    
    var urlFormatter:URLFormatter?
    
    init(urlFormatter: URLFormatter) {
        
        self.urlFormatter = urlFormatter
    }
    
    func getDetails(forCoordinates coordinates:Coordinates, completionBlock: @escaping CityDetailsCompletionBlock) {
        
        guard let urlFormatter = self.urlFormatter else { return }
        let urlString = urlFormatter.getCityDetailsURL(longitude: coordinates.longitude, latitude: coordinates.latitude)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                completionBlock(nil, error)
            }
            
            guard let data = data else { return }
            
            do {
                let city = try JSONDecoder().decode(City.self, from: data)
                completionBlock(city, nil)
                
            } catch let jsonError {
                print(jsonError)
                completionBlock(nil, jsonError)
            }
            
            }.resume()
    }
}
