//
//  WeatherCellDetailDatasource.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class WeatherCellDetailDatasource: Datasource {
    
    let weatherModel: WeatherModel
    required init(weatherModel: WeatherModel) {
        self.weatherModel = weatherModel
    }
    
    // This section only has 1 header, 1 cell and 1 footer.
    override func cellClasses() -> [DatasourceCell.Type] {
        return [TodayWeatherCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [DailyWeatherCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [ExtendedInfoCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
    override func headerItem(_ section: Int) -> Any? {
        return weatherModel.dailyArray
    }
    
    override func footerItem(_ section: Int) -> Any? {
        return weatherModel.extendedInfo
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return weatherModel.longDescription
    }
}
