//
//  WebServiceManager.swift
//  WebServiceDemo
//
//  Created by Ravi Dhorajiya on 02/05/18.
//  Copyright © 2018 Ravi Dhorajiya. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class WebServiceManager: AuthenticationHeader {
  
  static let shared = WebServiceManager()
  var alamoFireSessionManager = Alamofire.SessionManager.default
  
  func callWebService<T: Codable>(_ url: String, parameters: Parameters, method: HTTPMethod, _ encodingType: ParameterEncoding = JSONEncoding.default, completionHandler: @escaping([T]?, _ error: Error?, _ errorMessage: String?) -> Void) {
    
    alamoFireSessionManager.request(url, method: method, parameters: parameters, encoding: encodingType, headers: headers).responseJSON { response in
      if let error = response.result.error {
        completionHandler(nil, error, nil)
      } else {
        switch response.result {
        case .success(_):
          let json = response.data
          do {
            let serviceResponse = try JSONDecoder().decode(ServiceResponse<T>.self, from: json!)
            if let status = serviceResponse.status {
              switch status {
              case 0:
                completionHandler(nil, nil, serviceResponse.message)
              case 1:
                completionHandler(serviceResponse.data.response, nil, serviceResponse.message)
              default:
                completionHandler(nil, nil, nil)
              }
            }
          } catch let error {
            completionHandler(nil, error, nil)
          }
        case .failure(let error):
          completionHandler(nil, error, nil)
        }
      }
    }
  }
}
