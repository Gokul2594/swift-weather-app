//
//  ApiManager.swift
//  WeatherViewer
//
//  Created by Gokul Viswanathan on 2019-07-14.
//  Copyright © 2019 Gokul Viswanathan. All rights reserved.
//

import Foundation

class ApiManager {
    
    class func getWeatherDate(location: String) -> WeatherData {
        let data = WeatherData(location: location, currentTemperature: 30, description: "Cloudy")
        return data
    }
}
