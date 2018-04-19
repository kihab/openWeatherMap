//
//  MapViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var selectedLatitude: Double?
    var selectedLongitude: Double?
    var pin = MKPointAnnotation()
    
    @IBAction func userDidLongPress(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state != UIGestureRecognizerState.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        
        pin.coordinate = locationCoordinate
        mapView.addAnnotation(pin)
        
        selectedLatitude =  locationCoordinate.latitude
        selectedLongitude =  locationCoordinate.longitude
    }
    
    @IBAction func AddCityButtonPressed() {
        
        guard let long = selectedLongitude, let lat = selectedLatitude else {
            return
        }
        
        mapView.removeAnnotation(pin)
        locationService.getCityName(fromLongitude: long, AndLatitude: lat) { (addressDetail, error) in
            
            guard let address = addressDetail, let city = address["City"] as? String else{
                return
            }
            
            let localCity = LocalCityModel(name: city, longitude: long, latitude: lat)
            Storage.store(localCity: localCity)
        }
        
        
        
        
    }
}
