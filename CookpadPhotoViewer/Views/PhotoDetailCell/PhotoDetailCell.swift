//
//  PhotoDetailCell.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 21/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import Haneke

class PhotoDetailCell: UICollectionViewCell {

    // MARK: - Properties -
    
    var photo: Photo!
    var placeholder: UIImage!
    
    @IBOutlet weak var tmp: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var creationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - User Appareance -
    
    func setupWith(photo: Photo, placeholder: UIImage) {
        self.photo = photo
        
        titleLabel.text = photo.title?.capitalized
        descriptionLabel.text = photo.description?.capitalized

        var creationDate: String
        if photo.creationDate.isToday() {
            creationDate = "today"
        } else if photo.creationDate.isYesterday() {
            creationDate = "yesterday"
        } else {
            creationDate = "IN \(DateFormatter.dateFormatter.string(from: photo.creationDate))"
        }
        
        let creationInformations = "BY \(photo.authorName) \(creationDate)".uppercased()
        let attributedCreationInformation = NSMutableAttributedString(
            string: creationInformations,
            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 11),
                         NSForegroundColorAttributeName: UIColor.lightGray])

        attributedCreationInformation.addAttribute(NSForegroundColorAttributeName, value: UIColor.cookpadGreen, range: (creationInformations as NSString).range(of: photo.authorName.uppercased()))
        
        creationLabel.attributedText = attributedCreationInformation
        
        imageView.heroID = String(photo.id)
        titleLabel.heroID = "\(String(photo.id))-label"

        if let url = URL(string: photo.url) {
            imageView.hnk_setImageFromURL(url, placeholder: placeholder)
        }
    }
}
