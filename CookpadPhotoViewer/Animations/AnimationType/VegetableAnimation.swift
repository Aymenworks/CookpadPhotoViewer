//
//  VegetableAnimation.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

struct VegetableAnimation: Animable {
    
    var orientation: Double = .pi
    var size = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
    var position: CGPoint = CGPoint(x: UIScreen.main.bounds.width/2.0, y: 0)
    var emissionRange: CGFloat = CGFloat(Double.pi / 4)
    var birthRate: Float = 0.5

    static let fruitAndVegetablesImages = [#imageLiteral(resourceName: "broccoli"), #imageLiteral(resourceName: "cherry"), #imageLiteral(resourceName: "chicken-leg"), #imageLiteral(resourceName: "fried-egg"), #imageLiteral(resourceName: "grapes"), #imageLiteral(resourceName: "lobster"),
                                    #imageLiteral(resourceName: "meat"), #imageLiteral(resourceName: "orange"), #imageLiteral(resourceName: "cheese"), #imageLiteral(resourceName: "pear"), #imageLiteral(resourceName: "pizza"), #imageLiteral(resourceName: "strawberry"), #imageLiteral(resourceName: "watermelon"),
                                    #imageLiteral(resourceName: "ham"), #imageLiteral(resourceName: "melon"), #imageLiteral(resourceName: "mushroom")]
    var icons: [UIImage] = VegetableAnimation.fruitAndVegetablesImages
    
    var velocity: CGFloat {
        return 120
    }
}
