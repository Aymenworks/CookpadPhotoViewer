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
        return getPhotos(fromJson: "getStarters")
    }
    
    func getMainCourses() -> Observable<[Photo]> {
        return getPhotos(fromJson: "getMainCourses")
    }
    
    func getDesserts() -> Observable<[Photo]> {
        return getPhotos(fromJson: "getDesserts")
    }
    
    private func getPhotos(fromJson jsonFile: String) -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            do {
                let pathString = Bundle.main.path(forResource: jsonFile, ofType: "json")!
                let data = try Data(contentsOf: URL(fileURLWithPath: pathString))
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                let jsonPhotos = json["photos"]
                let photos = try [Photo].decode(jsonPhotos!)
                let photosResult: Result<[Photo]> = .success(photos)
                observer.onNext(photosResult.value!)

            } catch {
                print(error)
                observer.onNext([])
            }
            
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
