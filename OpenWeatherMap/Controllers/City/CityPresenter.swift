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
    
    init(viewController: CityViewControllerProtocol) {
        
        cityViewControler = viewController
    }
    
    func getDetails(forCoordinates coordinates: Coordinates?) {
    
        guard let coord = coordinates else { return }
        
        openWeatherService.getDetails(forCoordinates: coord) { [weak self] (cityDetails) in
            
            DispatchQueue.main.async {
                self?.cityViewControler?.populateDetails(forCity: cityDetails)
            }
            
        }
    }
}
