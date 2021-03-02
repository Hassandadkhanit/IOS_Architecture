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

typealias APIClientCompletionBlock = (_ response: HTTPURLResponse?, _ result: AnyObject?, _ error: Error?) -> Void

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
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        return Session(configuration: configuration)
    }()
    
    //MARK: - get Methods
  
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
    func serverRequest(
            method : HTTPMethodType,
            headers : HTTPHeaders,
            parameters : Parameters,
            routeUrl : String,
            completionHandler : @escaping APIClientCompletionBlock)  {

    sessionManager.request(routeUrl,
                           method: getMethod(method: method),
                           parameters: parameters,
                           encoding: URLEncoding.default,
                           headers:headers)
            .responseJSON { (response) in
            
                switch response.result {
                    case .success:
                        completionHandler(response.response, response.result as AnyObject?, nil)
                        self.showRequestDetailForSuccess(responseObject: response)
                        break
                    case .failure(let error):
                        completionHandler(response.response, nil, error)
                        self.showRequestDetailForFailure(responseObject: response)
                        if let statusCode = response.response?.statusCode {
                            
                        }
                        
                        break
                    
                }
        }
    }
    
    func showRequestDetailForSuccess(responseObject response : AFDataResponse<Any>) {
        
        print("\n\n\n✅✅✅✅ ------- Success Response Start ------- ✅✅✅✅\n")
        
        
        print("URL: "+(response.request?.url?.absoluteString ?? ""))
        
        print("\n=========    Status Code: \(response.response?.statusCode.description ?? "N/A")    ==========")
        
        if let header = response.request?.allHTTPHeaderFields {
            print("=========    HTTP Header Fields   ==========")
            print(header as AnyObject)
        }
        
        
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: .utf8)
            print("\n=========   Request httpBody   ========== \n" + (bodyString ?? ""))
        } else {
            print("\n=========   Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: .utf8)
            print("\n=========   Response Body   ========== \n" + (responseString ?? ""))
        } else {
            print("\n=========   Response Body   ========== \n" + "Found Response Body Nil")
        }
        print("\n✅✅✅✅ ------- Success Response End ------- ✅✅✅✅\n\n\n")
        
    }
    
    func showRequestDetailForFailure(responseObject response : AFDataResponse<Any>) {
        
        print("\n\n\n❌❌❌❌ ------- Failure Response Start ------- ❌❌❌❌\n")
        
        print("URL: "+(response.request?.url?.absoluteString ?? ""))
        
        print("\n=========    Status Code: \(response.response?.statusCode.description ?? "N/A")    ==========")
        
        if let header = response.request?.allHTTPHeaderFields {
            print("=========    HTTP Header Fields   ==========")
            print(header as AnyObject)
        }
        
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: .utf8)
            print("\n=========    Request httpBody   ========== \n" + (bodyString ?? ""))
        } else {
            print("\n=========    Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        
        print("\n=========   Response Body   ========== \n")
        
        if let errorMsg = response.error?.localizedDescription, !errorMsg.isBlank {
            print(errorMsg)
        } else {
            
            if let responseData = response.data, let responseString = String(data: responseData, encoding: .utf8) {
                print(responseString)
            } else {
                print("Found Response Body Nil")
            }
        }
        
        print("\n❌❌❌❌ ------- Failure Response End ------- ❌❌❌❌\n\n\n")
                
    }
    
    
}
