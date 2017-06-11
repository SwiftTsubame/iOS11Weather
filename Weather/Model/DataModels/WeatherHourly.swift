//
//  WeatherHourly.swift
//  Weather
//
//  Created by Haiyan Ma on 07/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct WeatherHourly: JSONDecodable {
    let hour: String?
    let temperature: Int?
    let description: WeatherImageRepresentation?
    
    init(json: JSON) {
        self.hour = json[ResponseKeys.Hourly.hour].stringValue
        self.temperature = json[ResponseKeys.Hourly.temperature].intValue
        self.description = WeatherImageRepresentation(rawValue: json[ResponseKeys.Hourly.description].stringValue)
    }
}


