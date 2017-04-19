//
//  ArrayExtension.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation

extension Array {
    func randomSort() -> Array {
        let sortedArray = sorted { _ in arc4random() < arc4random()  }
        return sortedArray
    }
}
