//
//  AppDelegateProtocols.swift
//  Weather
//
//  Created by Haiyan Ma on 07/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

protocol AppDelegateStylable {
    func formatStatusBar(_ application: UIApplication)
}

extension AppDelegateStylable {
    func formatStatusBar(_ application: UIApplication) {
        application.statusBarStyle = .lightContent
    }
}
