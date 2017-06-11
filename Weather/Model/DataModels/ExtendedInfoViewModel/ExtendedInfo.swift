//
//  ExtendedInfo.swift
//  Weather
//
//  Created by Yanstar Studio on 03/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

enum ExtendedInfo: String {
    case sunrise, sunset, chanceOfRain, humidity, wind, feelLike, precipitation, pressure, visibility, uvIndex
    
    var stringValue: String {
        var textString = ""
        switch self {
        case .uvIndex:
            textString = "UV INDEX"
        case .chanceOfRain:
            textString = "CHANCE OF RAIN"
        case .feelLike:
            textString = "FEEL LIKE"
        default:
            textString = self.rawValue.uppercased()
        }
        return "\(textString):  "
    }
}

struct WeatherExtendedInfo {
    
    let sunriseTime: String?
    let sunsetTime: String?
    
    var chanceOfRain: Float = 0
    var humidity: Float = 0
    
    var windSpeed: Int = 0
    let windDirection: String?
    
    var feelLikeTemperature: Int = 0
    
    var precipitation: Int = 0
    var pressure: Int = 0
    
    var visibility: Float = 0
    var uvIndex: Int = 0
    
    init(json: JSON) {
        self.sunriseTime = json[ResponseKeys.ExtendedInfo.sunriseTime].stringValue
        self.sunsetTime = json[ResponseKeys.ExtendedInfo.sunsetTime].stringValue
        self.chanceOfRain = json[ResponseKeys.ExtendedInfo.chanceOfRain].floatValue
        self.humidity = json[ResponseKeys.ExtendedInfo.humidity].floatValue
        self.windSpeed = json[ResponseKeys.ExtendedInfo.windSpeed].intValue
        self.windDirection = json[ResponseKeys.ExtendedInfo.windDirection].string
        self.feelLikeTemperature = json[ResponseKeys.ExtendedInfo.feelLikeTemperature].intValue
        self.precipitation = json[ResponseKeys.ExtendedInfo.precipitation].intValue
        self.pressure = json[ResponseKeys.ExtendedInfo.pressure].intValue
        self.visibility = json[ResponseKeys.ExtendedInfo.visibility].floatValue
        self.uvIndex = json[ResponseKeys.ExtendedInfo.uvIndex].intValue
    }
}


