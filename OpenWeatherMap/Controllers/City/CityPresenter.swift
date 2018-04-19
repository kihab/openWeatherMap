//
//  CityPresenter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

protocol CityPresenterProtocol {
    
    func getDetails(forCity city:LocalCityModel?)
}

class CityPresenter: CityPresenterProtocol {
    
    var cityViewControler:CityViewControllerProtocol?
    
    init(viewController: CityViewControllerProtocol) {
        
        cityViewControler = viewController
    }
    
    func getDetails(forCity city: LocalCityModel?) {
    
        guard let city = city else { return }
        
        openWeatherService.getDetails(forCity: city) { [weak self] (cityDetails) in
            
            DispatchQueue.main.async {
                self?.cityViewControler?.populateDetails(forCity: cityDetails)
            }
            
        }
    }
}
