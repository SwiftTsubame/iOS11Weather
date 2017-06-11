//
//  DataFormattingProtocols.swift
//  Weather
//
//  Created by Haiyan Ma on 08/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import Foundation

protocol WeatherFormatable {
    func floatToPercentageString(float: Float) -> String
    func addUnit(_ unitName: String, toNumber: Float) -> String
}

extension WeatherFormatable {
    func floatToPercentageString(float: Float) -> String {
        return "\(Int(float * 100))" + " %"
    }
    
    func addUnit<T>(_ unitName: String, toNumber: T) -> String {
        return "\(toNumber) \(unitName)"
    }
    
    func addDegreeSign<T>(toNumber: T)-> String {
        return "\(toNumber)°"
    }
    
}
