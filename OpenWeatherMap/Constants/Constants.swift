//
//  Constants.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/18/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import Foundation

class Constants {
    
    static let CITIES_VIEW_CELL_IDENTIFIER = "CitiesCell"
    static let CITY_DETAILS_SEGUE = "showCityDetailsSegue"
    static let NEW_CITY_DETAILS_SEGUE = "showNewLocationDetailsSegue"
    
    static let API_KEY = "c6e381d8c7ff98f0fee43775817cf6ad"
    static let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"    
    static let DEFAULT_UNIT = "metric"
    
    static let NOT_AVAILABLE = "NA"
    
    static let SPEED = "Speed"
    static let Degree = "Degree"
    static let MINIMUM = "Min"
    static let MAXIMUM = "Max"
    
    static let CITIES_LIST = "locallyStoredCitiesList"
    
    static let EROR_ALERT_TITLE = "Ooops"
    static let ERROR_ALERT_BUTTON = "OK"
    static let HOME_ERROR_ALERT_MESSAGE = "Please pin a location on the map to show its weather details"
    static let CITY_ERROR_ALERT_MESSAGE = "Sorry, can't get city weather details"

}
