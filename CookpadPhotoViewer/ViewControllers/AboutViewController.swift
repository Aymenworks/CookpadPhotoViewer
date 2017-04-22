//
//  AboutViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var animationType = VegetableAnimation()
        animationType.position = CGPoint(x: UIScreen.main.bounds.maxX, y: UIScreen.main.bounds.maxY-200)
        animationType.size = CGSize(width: 300, height: 1)
        animationType.orientation = -Double.pi / 2.0
        animationType.emissionRange = CGFloat(M_1_PI)

        let emitterLayer = animationType.emitter()
        view.layer.addSublayer(emitterLayer)
    }
    
    // MARK: - User Interaction -
    
    @IBAction func showCookpadRecipes(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://cookpad.com/fr/recettes/2429575-tarte-a-la-tomate-fromage-de-chevre-et-jambon")!)
    }

}
