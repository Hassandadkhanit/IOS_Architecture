//
//  BaseApi.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 25/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

typealias SuccessResult = (Dictionary<String,AnyObject>) -> Void
typealias FailureResult = (Error) -> Void

class BaseApi {
    
    static var Shared = BaseApi()
    
    let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        return SessionManager(configuration: configuration)
    }()
    
    func getHeaders() -> Dictionary<String,String> {
        return [:]
    }
    func getRequest(success : @escaping SuccessResult,
                    failure : @escaping FailureResult,
                    parameters : Parameters,
                    routeUrl : String)  {
        
        sessionManager.request(Constants.baseUrl, method: .get
            , parameters: nil, encoding: JSONEncoding.prettyPrinted, headers:nil).response { (response) in
                let data = JSON(response.data)
                var aa = data["slice_dur"]
                if response.data != nil {
                    success([:])
                }else {
                    failure(response.error!)
                }
        }
        
    }
}
