//
//  DailyWeather.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/24/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import Foundation

class DailyWeather {
    
    let icon: String?
    var dailyWeather: [Weather] = []
    
    init(data: [String : AnyObject]) {
        
        var weathersArray = (data["data"] as! NSArray) as Array
        
        for i in 0..<weathersArray.count {
            let weather = Weather(weatherDictonary: weathersArray[i] as! [String : Any])
            self.dailyWeather.append(weather)
            
        }
        
        icon = data["icon"] as? String
    }
}
