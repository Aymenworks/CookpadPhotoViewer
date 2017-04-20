//
//  Router.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import Alamofire

/* 
 Inspired from https://littlebitesofcocoa.com/93-creating-a-router-for-alamofire. I recommand u this website :).
   
 Use like that :
    Alamofire.request(Router.getDesserts)
             .responseJSON { jsonResponse in
             ...
    }
*/
enum Router {
    
    case getStarters
    case getMainCourses
    case getDesserts
    //case post([String: Any]) -- example of another use

    static let baseURL = URL(string: "https://api.500px.com/v1/photos/search?consumer_key=x5547uTw3cIbyGNT8P8L2E2gQxthtPUDqvLXVmEC&image_size=600")!
    
    var url: URL { return Router.baseURL.appendingPathComponent(route.path) }
    
    var route: (path: String, parameters: [String: Any]?, method: HTTPMethod) {
        switch self {
        case .getStarters: return ("", ["tag": "soup"], .get)
        case .getMainCourses: return ("", ["tag": "meat", "sort": "comments_count"], .get)
        case .getDesserts: return ("", ["tag": "dessert", "sort": "comments_count"], .get)
        //case .post(let parameters): return ("", parameters, .post) -- example of another use
        }
    }
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = route.method.rawValue
        let urlRequest = try! URLEncoding().encode(URLRequest(url: url), with: route.parameters)
        return urlRequest
    }
}
