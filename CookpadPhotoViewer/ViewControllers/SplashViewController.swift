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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "showApp", sender: self)
        }
    }
}
