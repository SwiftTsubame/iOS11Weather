//
//  WeatherDaily.swift
//  Weather
//
//  Created by Haiyan Ma on 09/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

enum WeatherImageRepresentation: String {
    case dayCloudy, dayPartlyCloudy, sunny, rainy, nightClear, nightCloudy, nightPartlyCloudy
    var stringValue: String {
        return self.rawValue
    }
}

struct WeatherDaily: JSONDecodable {
    let day: String?
    let temperatureLow: Int?
    let temperatureHigh: Int?
    let description: WeatherImageRepresentation?
    
    init(json: JSON) {
        self.day = json[ResponseKeys.Daily.day].stringValue
        self.temperatureHigh = json[ResponseKeys.Daily.temperatureHigh].intValue
        self.temperatureLow = json[ResponseKeys.Daily.temperatureLow].intValue
        self.description = WeatherImageRepresentation(rawValue: json[ResponseKeys.Daily.description].stringValue)
    }
}



