//
//  APIRouteUrls.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 27/12/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation

struct RouteUrls {
    
    static let users = "users"
    
    static func getRouteUrlWith(route:String) -> String  {
        let baseUrl = Constants.baseUrl
        return baseUrl + route
    }
}
