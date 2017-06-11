//
//  ExtendedInfoDatasource.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class ExtendedInfoDatasource: Datasource {
    
    let extendedInfo: [ExtendedInfo] = [.sunrise, .sunset, .chanceOfRain, .humidity, .wind, .feelLike, .precipitation, .pressure, .visibility, .uvIndex]
    let weatherExtendedInfoViewModel: WeatherExtendedInfoViewModel
    required init(weatherExtendedInfo: WeatherExtendedInfo) {
        self.weatherExtendedInfoViewModel = WeatherExtendedInfoViewModel(weatherExtendedInfo: weatherExtendedInfo)
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ExtendedDetailCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return extendedInfo.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        let infoString = weatherExtendedInfoViewModel.setupString(key: extendedInfo[indexPath.item])
        return [extendedInfo[indexPath.item]: infoString]
    }
}
