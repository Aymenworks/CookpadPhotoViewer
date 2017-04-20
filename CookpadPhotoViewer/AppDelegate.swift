//
//  AppDelegate.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import GlidingCollection

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupGlidingCollection()
        
        UITabBar.appearance().tintColor = .cookpadBrown
        return true
    }

    private func setupGlidingCollection() {
        GlidingConfig.shared.buttonsFont = UIFont.boldSystemFont(ofSize: 30)
        GlidingConfig.shared.activeButtonColor = .cookpadBrown
        GlidingConfig.shared.inactiveButtonsColor = GlidingConfig.shared.activeButtonColor
    }

}

