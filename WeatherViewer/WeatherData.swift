//
//  WeatherData.swift
//  WeatherViewer
//
//  Created by Gokul Viswanathan on 2019-07-14.
//  Copyright © 2019 Gokul Viswanathan. All rights reserved.
//

import Foundation

class WeatherData {
    let location: String
    let currentTemperature: Int
    let description: String
    let highTemperature: Int
    let lowTemperature: Int
    let tomorrowHighTemperature: Int
    let tomorrowLowTemperature: Int
    
    init(location: String, currentTemperature: Int, description: String, highTemperature: Int, lowTemperature: Int, tomorrowHighTemperature: Int, tomorrowLowTemperature: Int) {
        self.location = location
        self.currentTemperature = currentTemperature
        self.description = description
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.tomorrowHighTemperature = tomorrowHighTemperature
        self.tomorrowLowTemperature = tomorrowLowTemperature
        
    }
    
}
