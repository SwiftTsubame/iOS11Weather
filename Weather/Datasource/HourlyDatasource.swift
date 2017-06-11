//
//  HourlyDatasourceModel.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class HourlyWeatherDatasource: Datasource {
    
    let hourlyWeather: [WeatherHourly]
    required init(weatherHourly: [WeatherHourly]) {
        self.hourlyWeather = weatherHourly
    }
        
    override func cellClasses() -> [DatasourceCell.Type] {
        return [VerticalWeatherCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return hourlyWeather.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return hourlyWeather[indexPath.item]
    }
}
