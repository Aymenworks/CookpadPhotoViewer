//
//  PhotosAPI.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PhotosAPI {
    func getStarters() -> Observable<[Photo]>
    func getMainCourses() -> Observable<[Photo]>
    func getDesserts() -> Observable<[Photo]>
}
