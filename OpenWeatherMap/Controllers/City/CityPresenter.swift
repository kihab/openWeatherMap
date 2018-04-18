//
//  CityPresenter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

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
        
        openWeatherService.getCityDetails(city: city) { [weak self] (cityDetails) in
            
            self?.cityViewControler?.populateDetails(forCity: cityDetails)
        }
    }
}
