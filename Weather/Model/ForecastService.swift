//
//  ForecastService.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/23/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import Foundation

class ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getForecastCurently(latitude: Double, longitudude: Double, completion: @escaping (Weather?) -> Void) {
        
        if let forecastUrl = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitudude)" ) {
            let networkProcessor = NetworkProcessor(url: forecastUrl)
            networkProcessor.downloadJSONFromUrl { (jsonDictonay) in
                if let currentWeatherDictonary = jsonDictonay?["currently"] as? [String : Any] {
                    let currentWeather = Weather(weatherDictonary: currentWeatherDictonary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    func getForecastDaily(latitude: Double, longitudude: Double, completion: @escaping (DailyWeather?) -> Void) {
        
        if let forecastUrl = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitudude)" ) {
            let networkProcessor = NetworkProcessor(url: forecastUrl)
            networkProcessor.downloadJSONFromUrl { (jsonDictonay) in
                if let currentWeatherDictonary = jsonDictonay?["daily"] as? [String : AnyObject] {
                    let currentWeather = DailyWeather(data: currentWeatherDictonary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
