//
//  APIClientHandler.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 03/03/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias APIClientCompletionBlock = (_ response: HTTPURLResponse?, _ result: AnyObject?, _ error: NSError?) -> Void

enum HTTPHeaderField: String {
    case authentication     = "Authorization"
    case contentType        = "Content-Type"
    case acceptType         = "Accept"
    case acceptEncoding     = "Accept-Encoding"
}

enum ContentType : String {
    case json = "application/json"
}

enum HTTPMethodType  {
    case get
    case post
}

class APIClientHandler  {
    
    //MARK: - init Session
    let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        return SessionManager(configuration: configuration)
    }()
    
    //MARK: - get Methods
    func getHeaders() -> Dictionary<String,String> {
        return [:]
    }
    func getMethod(method : HTTPMethodType) -> HTTPMethod {
        switch method {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
    //MARK: - create extra layer
    
    //MARK: - get Methods
    func serverRequest(method : HTTPMethodType,
                parameters : Parameters,
                routeUrl : String,
                completionHandler : @escaping APIClientCompletionBlock)  {

    sessionManager.request(routeUrl,
                           method: getMethod(method: method),
                           parameters: parameters,
                           encoding: URLEncoding.default,
                           headers:getHeaders())
            .responseJSON { (response) in
            
                switch response.result {
                    case .success:
                        completionHandler(response.response, response.result.value as AnyObject?, nil)
                        break
                    case .failure(let error):
                        completionHandler(response.response, nil, error as NSError?)
                        break
                    
                }
        }
    }
    
    
    
}
