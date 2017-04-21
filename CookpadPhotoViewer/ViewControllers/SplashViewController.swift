//
//  SplashViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let animationType = VegetableAnimation()
        
        let emitterLayer = animationType.emitter()
        view.layer.addSublayer(emitterLayer)
        
        if let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController,
            let navigationController = tabBarController.viewControllers?.first as? BaseNavigationController,
            let exploreViewController = navigationController.visibleViewController as? ExploreViewController {
            
            exploreViewController.fetchData()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.present(tabBarController, animated: true, completion: nil)
            }
        }
    }
}
