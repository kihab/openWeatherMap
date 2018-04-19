//
//  HomePresenter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

protocol HomePresenterProtocol {
    
    func getCitiesList()
}

class HomePresenter: HomePresenterProtocol {

    var homeViewController: HomeViewControllerProtocol?
    
    init(viewController: HomeViewControllerProtocol) {
        homeViewController = viewController
    }
    
    func getCitiesList() {
        
        guard let cities =  Storage.getStoredCities() else {
            return
        }

        homeViewController?.populateCollectionView(withCitiesList: cities)
    }
    
    
}
