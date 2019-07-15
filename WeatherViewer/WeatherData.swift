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
    
    init(location: String, currentTemperature: Int, description: String) {
        self.location = location
        self.currentTemperature = currentTemperature
        self.description = description
    }
}
