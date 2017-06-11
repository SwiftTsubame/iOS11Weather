//
//  WeatherOverviewViewModel.swift
//  Weather
//
//  Created by Haiyan Ma on 09/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

struct WeatherOverviewViewModel: WeatherFormatable {
    
    private var weatherOverView: WeatherOverview?
    
    init(weatherOverView: WeatherOverview) {
        self.weatherOverView = weatherOverView
    }
    
    var cityAndDescriptionAttributedString: NSMutableAttributedString? {
        let cityName = weatherOverView?.city ?? "--"
        let weatherDescription = weatherOverView?.shortDescription?.capitalized ?? "--"
        
        let attributedString = NSMutableAttributedString.setupWithText(cityName, description: "\n" + weatherDescription, textFont: UIFont.systemFont(ofSize: 34), descriptionFont: UIFont.systemFont(ofSize: 16), textColor: UIColor.white, descriptionColor: UIColor.white)
        attributedString?.centerAlignWithSpacing(1.0)
        return attributedString
    }
    
    var low: String? {
        if let temperature = weatherOverView?.temperatureLow {
            return "\(temperature)"
        }
        return "-"
    }
    
    var high: String? {
        if let temperature = weatherOverView?.temperatureHigh {
            return "\(temperature)"
        }
        return "-"
    }
    
    var weekDay: String? {
        let weekDayText = weatherOverView?.weekDay ?? "--"
        return "\(weekDayText)  Today"
    }
    
    var temperatureString: String? {
        let temperature = weatherOverView?.currentTemperature ?? 0
        return addDegreeSign(toNumber: temperature)
    }
}
