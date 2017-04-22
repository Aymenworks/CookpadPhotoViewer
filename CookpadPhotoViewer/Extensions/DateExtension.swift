//
//  DateExtension.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 22/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation

extension Date {
    
    func isToday() -> Bool {
        let nowComponent = Calendar.current.dateComponents([.day , .month , .year], from: Date())
        let dateComponent = Calendar.current.dateComponents([.day , .month , .year], from: self)
        
        return nowComponent.day == dateComponent.day && nowComponent.month == dateComponent.month
            && nowComponent.year == dateComponent.year
    }
    
    func isYesterday() -> Bool {
        var yesterdayComponent = DateComponents()
        yesterdayComponent.day = -1
        let yesterdayDate = Calendar.current.date(byAdding: yesterdayComponent, to: Date())!
        yesterdayComponent = Calendar.current.dateComponents([.day , .month , .year], from: yesterdayDate)
        let dateComponent = Calendar.current.dateComponents([.day , .month , .year], from: self)
        
        return yesterdayComponent.day == dateComponent.day && yesterdayComponent.month == dateComponent.month
            && yesterdayComponent.year == dateComponent.year
    }
}
