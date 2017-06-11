//
//  Service.swift
//  Weather
//
//  Created by Haiyan Ma on 08/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    let tron = TRON(baseURL: ServiceConstant.baseUrlString)
    static let sharedInstance = Service()
    
    class JSONError: JSONDecodable {
        var errors: [String:[String]] = [:]
        required init(json: JSON) throws {
            if let dictionary = json["errors"].dictionary {
                for (key,value) in dictionary {
                    errors[key] = value.arrayValue.map( { return $0.stringValue } )
                }
            }
        }
    }
    
    func fetchWeather(completion: @escaping (WeatherDatasource?, Error?) -> ()) {
        let request: APIRequest<WeatherDatasource, JSONError> = tron.request(ServiceConstant.path)
        request.parameters = [
            ServiceConstant.ParameterKeys.alt: ServiceConstant.ParameterValues.alt,
            ServiceConstant.ParameterKeys.token: ServiceConstant.ParameterValues.token]
        request.perform(withSuccess: { (weatherDatasource) in
            completion(weatherDatasource, nil)
        }) { (error) in
            completion(nil, error)
            print("Failed to fetch our Json objects", error)
        }
    }
}
