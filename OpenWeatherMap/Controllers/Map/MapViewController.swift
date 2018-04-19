//
//  MapViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBAction func AddCityButtonPressed() {

        let city1 = LocalCityModel(name: "London", longitude: -0.13, latitude: 51.51)
        
        Storage.store(localCity: city1)
    }
}
