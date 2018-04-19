//
//  CityViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

protocol CityViewControllerProtocol {
    
    func populateDetails()
    func showErrorAlert()
    
    var currentCity:City? {set get}
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
    var storage = Storage()
    
    var currentCity:City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = OpenWeatherService(urlFormatter: URLFormatter())
        
        presenter = CityPresenter(viewController: self, openWeatherService: service)
        presenter?.getDetails(forCoordinates: coordinates)
    }
    
    func populateDetails() {
        guard let city = currentCity else {return}
        
        cityNameLabel.text = city.name
        weatherLabel.text = city.weather.first?.main
        degreeLabel.text = String("\(Int(round(city.main.temp)))\u{00B0}")
        humidityLabel.text = String(city.main.humidity)
        windSpeedLabel.text = String("\(Constants.SPEED): \(city.wind.speed)")
        temperatureLabel.text = String("\(Constants.MAXIMUM): \(Int(city.main.temp_max))  -  \(Constants.MINIMUM): \(Int(city.main.temp_min))")
        
        if let windDegree = city.wind.deg {
            windDegreeLabel.text = String("\(Constants.Degree): \(windDegree)")
        }
        if let rain = city.rain {
            rainLabel.text = String(rain.volume)
        }
        
        guard let coord = coordinates else { return }
        storage.store(localCity: LocalCityModel(name: city.name, coordinates: coord))
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: Constants.EROR_ALERT_TITLE, message: Constants.CITY_ERROR_ALERT_MESSAGE, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Constants.ERROR_ALERT_BUTTON, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
