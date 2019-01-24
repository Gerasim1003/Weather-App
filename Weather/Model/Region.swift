//
//  Region.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/23/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import Foundation

class Region
{
    let name: String
    let latitude: Double
    let longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
