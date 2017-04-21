//
//  MealCell.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import GlidingCollection
import Haneke

class MealCell: UICollectionViewCell {
    
    // MARK: - Propertiess -
    
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - User Appareance -
    
    func setupWith(photo: (url: String, placeholder: UIImage)) {
        contentView.clipsToBounds = true
        layer.shadowOffset = GlidingConfig.shared.cardShadowOffset
        layer.shadowColor = GlidingConfig.shared.cardShadowColor.cgColor
        layer.shadowOpacity = GlidingConfig.shared.cardShadowOpacity
        layer.shadowRadius = GlidingConfig.shared.cardShadowRadius
        
        if let url = URL(string: photo.url) {
            imageView.hnk_setImageFromURL(url, placeholder: photo.placeholder)
        }
    }
}
