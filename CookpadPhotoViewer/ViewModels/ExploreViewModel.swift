//
//  ExploreViewModel.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ExploreViewModel {
    
    // MARK: - Properties -
    
    let sectionsTitles = ["Starter", "Main Courses", "Dessert"]
    
    let service: PhotosAPI
    let error = Variable<Error?>(nil)
    let disposeBag = DisposeBag()
    
    var starters    = Variable<[Photo]>([])
    var mainCourses = Variable<[Photo]>([])
    var desserts    = Variable<[Photo]>([])
    
    let placeholderStarter    = #imageLiteral(resourceName: "placeholderStarter")
    let placeholderMainCourse = #imageLiteral(resourceName: "placeholderMainCourse")
    let placeholderDessert    = #imageLiteral(resourceName: "placeholderDessert")
    
    // MARK: - Lifecycle
    
    init(service: PhotosAPI) {
        self.service = service
    }
    
    // MARK: - Network -
    
    func getStarters() {
        self.service.getStarters().subscribe { event in
            self.handleEvent(event: event) { response in
                self.starters.value = response
            }
        }
        .addDisposableTo(self.disposeBag)
    }
    
    func getMainCourses() {
        self.service.getMainCourses().subscribe { event in
            self.handleEvent(event: event) { response in
                self.mainCourses.value = response
            }
        }
        .addDisposableTo(self.disposeBag)
    }
    
    func getDesserts() {
        self.service.getDesserts().subscribe { event in
            self.handleEvent(event: event) { response in
                self.desserts.value = response
            }
        }
        .addDisposableTo(self.disposeBag)
    }
    
    func handleEvent<Item>(event: Event<Item> ,completionHandler: (Item) -> ()) {
        switch event {
        case .next(let response):
            completionHandler(response)
        case .error(let error):
            print(error)
            self.error.value = error
        case .completed:
            break
        }
    }
    
    // MARK: - Utils -
    
    func numberOfPhotosFor(section: Int) -> Int {
        switch section {
            case 0: return starters.value.count
            case 1: return mainCourses.value.count
            case 2: return desserts.value.count
            default: return 0
        }
    }

    
    func photoUrlFor(section: Int, atIndex index: Int) -> (url: String, placeholder: UIImage) {
        switch section {
            case 0: return (starters.value[index].url, placeholderStarter)
            case 1: return (mainCourses.value[index].url, placeholderMainCourse)
            case 2: return (desserts.value[index].url, placeholderDessert)
            default: return ("", UIImage())
        }
    }
}
