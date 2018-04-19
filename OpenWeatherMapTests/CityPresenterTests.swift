//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import XCTest
@testable import OpenWeatherMap

class CityViewControllerMock: CityViewControllerProtocol {
    
    func populateDetails() {}
    func showErrorAlert() {}
    
    var currentCity: City?
}

class OpenWeatherServiceMock: OpenWeatherServiceProtocol {
    
    func getDetails(forCoordinates coordinates: Coordinates, completionBlock: @escaping CityDetailsCompletionBlock) {
        
        let city = City(name: "London", id: 0, weather: [Weather](), main: Main(temp: 0, humidity: 0, temp_min: 0, temp_max: 0), wind: Wind(speed: 0, deg: nil), rain: nil)
        
        completionBlock(city, nil)
    }
}

class CityPresenterTests: XCTestCase {
    
    var subject: CityPresenter!
    var cityViewController: CityViewControllerMock!
    var openWeatherService: OpenWeatherServiceMock!
    
    override func setUp() {
        super.setUp()
        
        cityViewController = CityViewControllerMock()
        openWeatherService = OpenWeatherServiceMock()
        subject = CityPresenter(viewController: cityViewController, openWeatherService: openWeatherService)
    }
    
    override func tearDown() {
        super.tearDown()
        
        subject = nil
        cityViewController = nil
        openWeatherService = nil
    }
    
    func testGetDetailsWithCorrectCoordinates() {
        //London Coordinates
        let coord = Coordinates(longitude: 51.51, latitude: -0.13)
        subject.getDetails(forCoordinates: coord)
        
        XCTAssertEqual(subject.cityViewControler?.currentCity?.name, "London")
    }
    
    func testGetDetailsWithIncorrectCoordinates() {
        subject.getDetails(forCoordinates: nil)
        XCTAssertNil(subject.cityViewControler?.currentCity)
    }
    
}
