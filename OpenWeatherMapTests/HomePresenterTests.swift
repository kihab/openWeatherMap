//
//  HomePresenterTests.swift
//  OpenWeatherMapTests
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import XCTest
@testable import OpenWeatherMap

class HomeViewControllerMock: HomeViewControllerProtocol {

    func populateCollectionView() {}
    
    var citiesList: [LocalCityModel]?
}

class StorageMock: StorageProtocol {
    
    func store(localCity city: LocalCityModel) {}
    
    func remove(localCity city: LocalCityModel) {}
    
    func getStoredCities() -> [LocalCityModel]? {
        
        let city1 = LocalCityModel(name: "London", coordinates: Coordinates(longitude: 0, latitude: 0))
        let city2 = LocalCityModel(name: "Cairo", coordinates: Coordinates(longitude: 0, latitude: 0))
        
        var citiesList = [LocalCityModel]()
        citiesList.append(city1)
        citiesList.append(city2)
        
        return citiesList
    }
}

class HomePresenterTests: XCTestCase {
    
    var subject: HomePresenter!
    var homeViewController: HomeViewControllerMock!
    var storage: StorageMock!
    
    override func setUp() {
        super.setUp()
        
        homeViewController = HomeViewControllerMock()
        storage = StorageMock()
        subject = HomePresenter(viewController: homeViewController, storageHelper: storage)
    }
    
    override func tearDown() {
        super.tearDown()
        subject = nil
        homeViewController = nil
        storage = nil
    }
    
    func testGetCitiesListExists() {
        subject.getCitiesList()
        XCTAssertNotNil(subject.homeViewController?.citiesList)
    }
    
}
