//
//  ApiManager.swift
//  WeatherViewer
//
//  Created by Gokul Viswanathan on 2019-07-14.
//  Copyright © 2019 Gokul Viswanathan. All rights reserved.
//

import Foundation
import OAuthSwift

class ApiManager {
    
    private let oauth: OAuth1Swift?
    private let url: String = "https://weather-ydn-yql.media.yahoo.com/forecastrss"
    private var headers:[String: String] {
        return [
            "X-Yahoo-App-Id": "2QMI0o58"
        ]
    }
    
    init() {
        self.oauth = OAuth1Swift(consumerKey: "dj0yJmk9TXZIM1l4YTBhcWV2JmQ9WVdrOU1sRk5TVEJ2TlRnbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTc2",
                                 consumerSecret: "117ba3c40175b13a3ecf6c8575cd9e1b7c2a544a")
    }
    
    func getWeatherDate(
        location: String,
        success: @escaping (WeatherData?) -> Void,
        failure: @escaping () -> Void
        ) {
        makeRequest(location: location, success: {(jsonData) -> Void in
            guard let json = jsonData as? [String: Any],
                let current = json["current_observation"] as? [String: Any],
                let condition = current["condition"] as? [String: Any] else {
                    print("Error processing condition")
                    failure()
                    return
            }
            
            guard let temperature = condition["temperature"] as? Int,
                let description = condition["text"] as? String else {
                    print("Error getting todays data")
                    failure()
                    return
            }
            
            guard let forecast = json["forecasts"] as? [[String: Any]] else {
                print("Could not get forecast data")
                failure()
                return
            }
            
            guard let highTemperature = forecast[0]["high"] as? Int,
                let lowTemperature = forecast[0]["low"] as? Int else {
                    print("Error getting todays forecast")
                    failure()
                    return
            }
            
            guard let tomorrowHighTemperature = forecast[1]["high"] as? Int,
                let tomorrowLowTemperature = forecast[1]["low"] as? Int else {
                    print("Error getting tomorrows forecast")
                    failure()
                    return
            }
            
            let weatherData = WeatherData(location: location, currentTemperature: temperature, description: description, highTemperature: highTemperature, lowTemperature: lowTemperature, tomorrowHighTemperature: tomorrowHighTemperature, tomorrowLowTemperature: tomorrowLowTemperature)
            
            success(weatherData)
        }, failure: {() -> Void in
            failure()
        })
    }
    
    func makeRequest(
        location: String,
        success: @escaping(Any?) -> Void,
        failure: @escaping() -> Void
        ){
        let parameters = ["location": location, "format": "json", "u": "c"]
        
        self.oauth?.client.request(
            self.url,
            method: .GET,
            parameters: parameters,
            headers: self.headers,
            body: nil,
            checkTokenExpiration: true,
            completionHandler: {(data) -> Void in
                guard let res = try? data.get() else {
                    print("No response")
                    failure()
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: res.data) else {
                    print("Unable to convert to JSON")
                    failure()
                    return
                }
                success(json)
            }
        )
    }
}
