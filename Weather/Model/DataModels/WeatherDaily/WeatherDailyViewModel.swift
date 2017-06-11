//
//  WeatherDailyViewModel.swift
//  Weather
//
//  Created by Haiyan Ma on 09/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

struct WeatherDailyViewModel {
    
    private var weatherDaily: WeatherDaily?
    init(weatherDaily: WeatherDaily) {
        self.weatherDaily = weatherDaily
    }
    
    var low: String? {
        if let temperature = weatherDaily?.temperatureLow {
            return "\(temperature)"
        }
        return "-"
    }
    
    var high: String? {
        if let temperature = weatherDaily?.temperatureHigh {
            return "\(temperature)"
        }
        return "-"
    }
    
    var weekDay: String? {
        return weatherDaily?.day
    }
    
    var weatherImage: UIImage? {
        if let imageIconName = weatherDaily?.description?.stringValue {
            return UIImage(named: imageIconName)
        }
        return nil
    }
}
