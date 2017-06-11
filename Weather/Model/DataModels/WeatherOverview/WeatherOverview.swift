//
//  WeatherOverview.swift
//  Weather
//
//  Created by Haiyan Ma on 07/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct WeatherOverview {
    let city: String?
    let shortDescription: String?
    let currentTemperature: Int?
    let temperatureLow: Int?
    let temperatureHigh: Int?
    let weekDay: String?
    
    init(json: JSON) {
        self.city = json[ResponseKeys.WeatherOverview.city].stringValue
        self.shortDescription = json[ResponseKeys.WeatherOverview.description].stringValue
        self.currentTemperature = json[ResponseKeys.WeatherOverview.temperature].intValue
        self.temperatureLow = json[ResponseKeys.WeatherOverview.temperatureLow].intValue
        self.temperatureHigh = json[ResponseKeys.WeatherOverview.temperatureHigh].intValue
        self.weekDay = json[ResponseKeys.WeatherOverview.weekday].string
    }
}


