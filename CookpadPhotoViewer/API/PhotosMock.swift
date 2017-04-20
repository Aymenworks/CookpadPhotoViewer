//
//  PhotosMock.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import Decodable
import Alamofire
import RxSwift
import RxCocoa

struct PhotosMock: PhotosAPI {
    
    func getStarters() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            let photos = self.photos(fromJson: "getStarters")
            observer.onNext(photos)
            
            return Disposables.create()
        }
    }
    
    func getMainCourses() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            let photos = self.photos(fromJson: "getMainCourses")
            observer.onNext(photos)
            
            return Disposables.create()
        }
    }
    
    func getDesserts() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            let photos = self.photos(fromJson: "getDesserts")
            observer.onNext(photos)
            
            return Disposables.create()
        }
    }
    
    private func photos(fromJson jsonFile: String) -> [Photo] {
        do {
            let pathString = Bundle.main.path(forResource: jsonFile, ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: pathString))
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
            let jsonPhotos = json["photos"]
            let photos = try [Photo].decode(jsonPhotos!)
            let photosResult: Result<[Photo]> = .success(photos)
            
            return photosResult.value!
        } catch {
            print(error)
            return []
        }
    }
}
