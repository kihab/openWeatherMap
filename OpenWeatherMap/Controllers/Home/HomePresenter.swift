//
//  HomePresenter.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

protocol HomePresenterProtocol {
    
    func getCitiesList()
    func removeCity(city:LocalCityModel)
}

class HomePresenter: HomePresenterProtocol {

    weak var homeViewController: HomeViewControllerProtocol?
    var storage: StorageProtocol?
    
    init(viewController: HomeViewControllerProtocol, storageHelper: StorageProtocol) {
        homeViewController = viewController
        storage = storageHelper
    }
    
    func getCitiesList() {
        
        guard let storageHelper = storage, let cities =  storageHelper.getStoredCities() else {
            return
        }
        
        homeViewController?.citiesList = cities
        homeViewController?.populateCollectionView()
    }
    
    
    func removeCity(city:LocalCityModel) {
        
        guard let storageHelper = storage else { return }
        
        storageHelper.remove(localCity: city)
        getCitiesList()
        
    }
    
}
