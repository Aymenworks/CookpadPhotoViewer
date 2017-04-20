//
//  SwinjectStoryboardExtension.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        
        Container.loggingFunction = nil

        if ProcessInfo.processInfo.arguments.contains("Mock") {
            defaultContainer.register(PhotosAPI.self) { _ in PhotosMock() }
         } else {
            defaultContainer.register(PhotosAPI.self) { _ in PhotosNetwork() }
         }
        
        defaultContainer.register(ExploreViewModel.self) { r in
            let viewModel = ExploreViewModel(service: r.resolve(PhotosAPI.self)!)
            return viewModel
        }
        
        defaultContainer.storyboardInitCompleted(ExploreViewController.self) { r, c in
            c.viewModel = r.resolve(ExploreViewModel.self)
        }
    }
}
