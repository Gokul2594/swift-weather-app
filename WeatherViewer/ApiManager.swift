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
    
    func getWeatherDate(location: String) -> WeatherData {
        makeRequest(location: location, success: {(jsonObject) -> Void in
            print(jsonObject)
        })
        let data = WeatherData(location: location, currentTemperature: 30, description: "Cloudy")
        return data
    }
    
    func makeRequest(location: String, success: @escaping(Any?) -> Void){
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
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: res.data) else {
                    print("Unable to convert to JSON")
                    return
                }
                success(json)
            }
        )
    }
}
