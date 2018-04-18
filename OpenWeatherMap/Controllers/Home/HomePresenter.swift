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
        var cities = [LocalCityModel]()
        let coor1 = Coordinates(longitude: -0.13, latitude: 51.51)
        let city1 = LocalCityModel(name: "London", coordinates: coor1)
        let city2 = LocalCityModel(name: "Cairo", coordinates: coor1)
        let city3 = LocalCityModel(name: "Berlin", coordinates: coor1)
        cities.append(city1)
        cities.append(city2)
        cities.append(city3)
        
        homeViewController?.populateCollectionView(withCitiesList: cities)
    }
    
    
}
