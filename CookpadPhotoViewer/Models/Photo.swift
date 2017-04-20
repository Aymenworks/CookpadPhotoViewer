//
//  Photo.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import Decodable

struct Photo {
    let url: String
}

extension Photo: Decodable {
    public static func decode(_ json: Any) throws -> Photo {
        return try Photo(
            url: json => "image_url"
        )
    }
}
