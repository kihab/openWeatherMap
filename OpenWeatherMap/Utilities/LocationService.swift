//
//  LocationService.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

typealias JSONDictionary = [String:Any]
typealias getCityNameCompletionBlock = (_ address: JSONDictionary?, _ error: Error?) -> ()

protocol locationServiceProtocol {
    
    static func getCityName(fromLongitude longitude:Double, AndLatitude latitude:Double,
                            completionBlock: @escaping getCityNameCompletionBlock)
}
class locationService: locationServiceProtocol {
    
    static func getCityName(fromLongitude longitude: Double, AndLatitude latitude: Double,
                            completionBlock: @escaping getCityNameCompletionBlock) {
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in

            if let e = error {
                completionBlock(nil, e)

            } else {
                let placeArray = placemarks
                var placeMark: CLPlacemark!
                placeMark = placeArray?[0]
                guard let address = placeMark.addressDictionary as? JSONDictionary else {
                    return
                }
                completionBlock(address, nil)
            }


        }
        
    }
    
}
