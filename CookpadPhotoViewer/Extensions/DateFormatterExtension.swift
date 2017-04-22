//
//  DateFormatterExtension.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 22/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()
}
