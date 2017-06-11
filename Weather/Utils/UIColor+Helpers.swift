//
//  UIColor+Helpers.swift
//  Weather
//
//  Created by Haiyan Ma on 07/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

extension UIColor {
    class func weatherWhite() -> UIColor {
        return white.withAlphaComponent(0.8)
    }
    class func weatherSemiTransparent() -> UIColor {
        return white.withAlphaComponent(0.5)
    }
}
