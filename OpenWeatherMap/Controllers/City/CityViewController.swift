//
//  CityViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

protocol CityViewControllerProtocol {
    
    func populateDetails(forCity city:City)
}

class CityViewController: UIViewController, CityViewControllerProtocol {
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var weatherLabel:UILabel!
    @IBOutlet weak var degreeLabel:UILabel!
    @IBOutlet weak var humidityLabel:UILabel!
    @IBOutlet weak var rainLabel:UILabel!
    @IBOutlet weak var windSpeedLabel:UILabel!
    @IBOutlet weak var windDegreeLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    var presenter: CityPresenterProtocol?
    var coordinates:Coordinates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CityPresenter(viewController: self)        
        presenter?.getDetails(forCoordinates: coordinates)
    }
    
    func populateDetails(forCity city: City) {
        
        cityNameLabel.text = city.name
        weatherLabel.text = city.weather.first?.main
        degreeLabel.text = String(city.main.temp)
        humidityLabel.text = String(city.main.humidity)
        windSpeedLabel.text = String("\(Constants.SPEED): \(city.wind.speed)")
        windDegreeLabel.text = String("\(Constants.Degree): \(city.wind.deg)")
        temperatureLabel.text = String("\(Constants.MAXIMUM): \(city.main.temp_max) - \(Constants.MINIMUM): \(city.main.temp_min)")
        if let rain = city.rain {
            rainLabel.text = String(rain.volume)
        } else {
            rainLabel.text = Constants.NOT_AVAILABLE
        }
        
        
        guard let coord = coordinates else { return }
        Storage.store(localCity: LocalCityModel(name: city.name, coordinates: coord))


    }
}
