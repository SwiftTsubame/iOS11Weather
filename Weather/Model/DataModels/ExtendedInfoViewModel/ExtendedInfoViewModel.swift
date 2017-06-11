//
//  ExtendedInfoViewModel.swift
//  Weather
//
//  Created by Haiyan Ma on 09/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

struct WeatherExtendedInfoViewModel: WeatherFormatable {
    
    private var info: WeatherExtendedInfo
    init(weatherExtendedInfo: WeatherExtendedInfo) {
        self.info = weatherExtendedInfo
    }
    
    func setupString(key: ExtendedInfo) -> String {
        switch key {
        case .sunrise:
            return info.sunriseTime ?? ""
        case .sunset:
            return info.sunsetTime ?? ""
        case .chanceOfRain:
            return floatToPercentageString(float: info.chanceOfRain)
        case .humidity:
            return floatToPercentageString(float: info.humidity)
        case .wind:
            return (info.windDirection ?? "") + " " + addUnit(GlobalConstant.Units.windSpeed, toNumber: info.windSpeed)
        case .feelLike:
            return addDegreeSign(toNumber: "\(info.feelLikeTemperature)")
        case .precipitation:
            return addUnit(GlobalConstant.Units.precipitation, toNumber: info.precipitation)
        case .pressure:
            return addUnit(GlobalConstant.Units.pressure, toNumber: info.pressure)
        case .visibility:
            return addUnit(GlobalConstant.Units.visibility, toNumber: info.visibility)
        case .uvIndex:
            return "\(info.uvIndex)"
        }
    }
}
