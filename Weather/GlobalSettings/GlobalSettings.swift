//
//  WeatherHeaders.swift
//  Weather
//
//  Created by Yanstar Studio on 15/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

struct ServiceConstant {
    static let baseUrlString = "https://firebasestorage.googleapis.com/v0/b/weather-41a5a.appspot.com"
    static let path = "/o/weatherDatabase.json"
    
    struct ParameterKeys {
        static let alt = "alt"
        static let token = "token"
    }
    struct ParameterValues {
        static let alt = "media"
        static let token = "c6d45c3c-4c11-47e4-8660-b16a3433b01e"
    }
}

struct NotificationNames {
    static let setOffset = "setOffset"
}

struct ResponseKeys {
    
    struct Weather {
        static let overview = "overview"
        static let extendedInfo = "extendedInfo"
        static let longDescription = "longDescription"
        static let hourly = "hourly"
        static let daily = "daily"
    }
    
    struct WeatherOverview {
        static let city = "city"
        static let description = "description"
        static let temperature = "temperature"
        static let temperatureLow = "temperatureLow"
        static let temperatureHigh = "temperatureHigh"
        static let weekday = "weekday"
    }
    struct Hourly {
        static let hour = "hour"
        static let description = "description"
        static let temperature = "temperature"
    }
    
    struct Daily {
        static let day = "weekday"
        static let temperatureHigh = "temperatureHigh"
        static let temperatureLow = "temperatureLow"
        static let description = "description"
    }
    
    struct ExtendedInfo {
        static let sunriseTime = "sunriseTime"
        static let sunsetTime = "sunsetTime"
        static let chanceOfRain = "chanceOfRain"
        static let humidity = "humidity"
        static let windSpeed = "windSpeed"
        static let windDirection = "windDirection"
        static let feelLikeTemperature = "feelLikeTemperature"
        static let precipitation = "precipitation"
        static let pressure = "pressure"
        static let visibility = "visibility"
        static let uvIndex = "uvIndex"
    }
}

struct GlobalConstant {
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    static let margin: CGFloat = 16
    
    struct Units {
        static let windSpeed = "km/hr"
        static let precipitation = "cm"
        static let pressure = "hPa"
        static let visibility = "km"
    }
}

enum WeatherHeaders: Int {
    case topHeader, centerHeader
    
    var section: Int {
        return self.rawValue
    }
    
    var defaultHeight: CGFloat {
        switch self {
        case .topHeader:
            return 0.48 * GlobalConstant.screenHeight
        case .centerHeader:
            return 0.17 * GlobalConstant.screenHeight
        }
    }
    
    var minimumHeight: CGFloat {
        switch self {
        case .topHeader:
            return 100
        case .centerHeader:
            return defaultHeight
        }
    }
}

enum WeatherCells: Int {
    case extendedInfo, todayDescription, dailyCells, extendedInfoCells
    var defaultHeight: CGFloat {
        switch self {
        case .extendedInfo:
            return 68
        case .todayDescription:
            return 74
        case .dailyCells:
            return 290
        case .extendedInfoCells:
            return 340
        }
    }
}
