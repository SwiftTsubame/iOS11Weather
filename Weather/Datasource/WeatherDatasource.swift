//
//  WeatherDatasource.swift
//  Weather
//
//  Created by Yanstar Studio on 12/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents
import UIKit
import TRON
import SwiftyJSON

class WeatherDatasource: Datasource, JSONDecodable {
    
    let weatherModel: WeatherModel
    
    required init(json: JSON) throws {
        self.weatherModel = try WeatherModel(json: json)
    }
        
    let headerCells: [DatasourceCell.Type] = [WeatherTopHeaderCell.self, WeatherSecondHeader.self]
    
    let cells: [DatasourceCell.Type] = [WeatherCell.self]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return headerCells
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return cells
    }
    
    override func numberOfSections() -> Int {
        return headerCells.count
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return section == WeatherHeaders.topHeader.section ? 0 : cells.count // top section has no cells
    }
    
    override func headerItem(_ section: Int) -> Any? {
        
        return [weatherModel.overview, weatherModel.hourlyArray][section]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return weatherModel
    }
}





