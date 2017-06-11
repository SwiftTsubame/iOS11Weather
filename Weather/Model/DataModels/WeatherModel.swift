//
//  WeatherModel.swift
//  Weather
//
//  Created by Yanstar Studio on 11/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import TRON
import SwiftyJSON

class WeatherModel: JSONDecodable {
    var dailyArray: [WeatherDaily] = []
    let overview: WeatherOverview
    var hourlyArray: [WeatherHourly] = []
    let extendedInfo: WeatherExtendedInfo
    let longDescription: WeatherLongDescription
    
    required init(json: JSON) throws {
        self.overview = WeatherOverview(json: json[ResponseKeys.Weather.overview])
        self.extendedInfo = WeatherExtendedInfo(json: json[ResponseKeys.Weather.extendedInfo])
        self.longDescription = WeatherLongDescription(json: json[ResponseKeys.Weather.longDescription])
        
        guard let hourlyJsonArray = json[ResponseKeys.Weather.hourly].array, let dailyJsonArray = json[ResponseKeys.Weather.daily].array else {
            throw NSError(domain: "weatherapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid in Daily/Hourly."]) }
        self.hourlyArray = try hourlyJsonArray.decode()
        self.dailyArray = try dailyJsonArray.decode()
    }
}
