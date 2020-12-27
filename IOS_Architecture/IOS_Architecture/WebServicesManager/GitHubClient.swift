//
//  GitHubClient.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 27/12/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import Alamofire

extension APIClient {
    func getProfile(parameters : Parameters,completion :@escaping APIClientCompletionBlock) {
    
        let url = RouteUrls.getRouteUrlWith(route: RouteUrls.users)
        
        self.serverRequest(method: .get,headers: getHeaders(), parameters: parameters, routeUrl: url, completionHandler: completion)
    }
}

