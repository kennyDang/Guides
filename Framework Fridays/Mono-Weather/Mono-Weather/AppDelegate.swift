//
//  AppDelegate.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/24/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let mainViewController = MainViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()

        return true
    }
}

