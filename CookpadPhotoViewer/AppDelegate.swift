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
        GlidingConfig.shared.buttonsFont = UIFont.systemFont(ofSize: 30, weight: UIFontWeightHeavy)
        GlidingConfig.shared.activeButtonColor = .cookpadOrange
        GlidingConfig.shared.inactiveButtonsColor = GlidingConfig.shared.activeButtonColor
        GlidingConfig.shared.cardsSize = CGSize(width: round(UIScreen.main.bounds.width * 0.7), height: round(UIScreen.main.bounds.height * 0.45))
    }
}

