//
//  APIClient.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 03/03/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import Alamofire

class APIClient : APIClientHandler {
    static var shared = APIClient()
    
    func getHeaders() -> HTTPHeaders {
          return [
            "Accept": "application/vnd.github.v3+json"
        ]
      }
}
