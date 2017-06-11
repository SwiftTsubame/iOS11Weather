//
//  AppDelegate.swift
//  Weather
//
//  Created by Haiyan Ma on 10/05/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppDelegateStylable {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = WeatherController()
        
        formatStatusBar(application)
        return true
    }
}

