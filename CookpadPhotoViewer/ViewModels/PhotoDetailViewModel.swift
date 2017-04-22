//
//  PhotoDetailViewModel.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 22/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

struct PhotoDetailViewModel {
    
    func attributedCreationInformation(from photo: Photo) -> NSMutableAttributedString {
        var creationDate: String
        
        if photo.creationDate.isToday() {
            creationDate = "today"
        } else if photo.creationDate.isYesterday() {
            creationDate = "yesterday"
        } else {
            creationDate = "IN \(DateFormatter.dateFormatter.string(from: photo.creationDate))"
        }
        
        let creationInformations = "BY \(photo.authorName) \(creationDate)".uppercased()
        
        let attributedCreationInformation = NSMutableAttributedString(string: creationInformations,
            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 11),
                         NSForegroundColorAttributeName: UIColor.lightGray])
        
        attributedCreationInformation.addAttribute(NSForegroundColorAttributeName, value: UIColor.cookpadOrange,
                                                   range: (creationInformations as NSString).range(of: photo.authorName.uppercased()))
        
        return attributedCreationInformation
    }
}
