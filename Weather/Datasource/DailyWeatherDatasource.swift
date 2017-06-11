//
//  DailyDatasourceModel.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class DailyWeatherDatasource: Datasource {
    
    var dailyWeather: [WeatherDaily] = []
    required init(dailyWeather: [WeatherDaily]) {
        self.dailyWeather = dailyWeather
    }
        
    override func cellClasses() -> [DatasourceCell.Type] {
        return [DailyDetailCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return dailyWeather.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {        
        return dailyWeather[indexPath.item]
    }
}
