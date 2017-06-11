//
//  Collection+Extension.swift
//  Weather
//
//  Created by Haiyan Ma on 09/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}
