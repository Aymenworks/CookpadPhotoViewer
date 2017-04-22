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
    let id: Int
    let title: String?
    let description: String?
    let url: String
    let authorName: String
    let creationDate: Date
}

extension Photo: Decodable {
    public static func decode(_ json: Any) throws -> Photo {
        return try Photo(
            id: json => "id",
            title: json =>? "name",
            description: json =>? "description",
            url: json => "image_url",
            authorName: json => "user" => "fullname",
            creationDate: json => "created_at"
        )
    }
}
