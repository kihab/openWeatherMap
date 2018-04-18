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
    var localCity:LocalCityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CityPresenter(viewController: self)        
        presenter?.getDetails(forCity: localCity)
    }
    
    func populateDetails(forCity city: City) {
        cityNameLabel.text = city.name
        weatherLabel.text = city.weather.first?.main
        degreeLabel.text = String(city.main.temp)
        humidityLabel.text = String(city.main.humidity)
        windSpeedLabel.text = String(city.wind.speed)
        windDegreeLabel.text = String(city.wind.deg)
        temperatureLabel.text = String("\(city.main.temp_min) - \(city.main.temp_max)")
        guard let rain = city.rain else {
            rainLabel.text = Constants.NOT_AVAILABLE
            return
        }
        rainLabel.text = String(rain.volume)
    }
}
