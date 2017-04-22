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
import Hero

class MealCell: UICollectionViewCell {
    
    // MARK: - Propertiess -
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerTitleView: UIView!
    
    var photo: Photo!
    
    // MARK: - User Appareance -
    
    func setupWith(model: Photo, placeholder: UIImage) {
        photo = model
        
        contentView.clipsToBounds = true
        layer.shadowOffset = GlidingConfig.shared.cardShadowOffset
        layer.shadowColor = GlidingConfig.shared.cardShadowColor.cgColor
        layer.shadowOpacity = GlidingConfig.shared.cardShadowOpacity
        layer.shadowRadius = GlidingConfig.shared.cardShadowRadius
        
        imageView.heroID = String(photo.id)
        containerTitleView.heroID = "\(String(photo.id))-label"
        titleLabel.text = photo.name?.capitalized
        
        if let url = URL(string: photo.url) {
            imageView.hnk_setImageFromURL(url, placeholder: placeholder)
        }
    }
}
