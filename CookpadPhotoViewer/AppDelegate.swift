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
        
        return true
    }

    private func setupGlidingCollection() {
        GlidingConfig.shared.buttonsFont = UIFont.boldSystemFont(ofSize: 26)
        GlidingConfig.shared.activeButtonColor = UIColor(red: 52/255, green: 0, blue: 0, alpha: 1.0)
        GlidingConfig.shared.inactiveButtonsColor = GlidingConfig.shared.activeButtonColor
    }

}

