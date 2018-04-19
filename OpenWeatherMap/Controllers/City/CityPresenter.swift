//
//  CityPresenter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

protocol CityPresenterProtocol {
    
    func getDetails(forCoordinates coordinates:Coordinates?)
}

class CityPresenter: CityPresenterProtocol {
    
    var cityViewControler:CityViewControllerProtocol?
    var weatherService:OpenWeatherService?
    
    init(viewController: CityViewControllerProtocol, openWeatherService: OpenWeatherService) {
        
        cityViewControler = viewController
        weatherService = openWeatherService
    }
    
    func getDetails(forCoordinates coordinates: Coordinates?) {
    
        guard let coord = coordinates, let service = weatherService else { return }
        
        service.getDetails(forCoordinates: coord) { [weak self] (cityDetails, error) in
            
            guard let city = cityDetails, error == nil else {                
                self?.cityViewControler?.showErrorAlert()
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.cityViewControler?.populateDetails(forCity: city)
            }
            
        }
    }
}
