//
//  ServiceResponse.swift
//  WebServiceDemo
//
//  Created by Ravi Dhorajiya on 02/05/18.
//  Copyright © 2018 Ravi Dhorajiya. All rights reserved.
//

import Foundation

struct ServiceResponse<T: Codable>: Codable {

  struct Data<U: Codable>: Codable {
    enum CodingKeys: String, CodingKey {
      case response = "product_list" // user
    }
    let response: [U]
  }
  
  private enum CodingKeys: String, CodingKey {
    case userToken, status, message, data
  }
  let userToken: String?
  let status: Int?
  let message: String?
  let data: Data<T>
}

func responseKey(_ type: Codable) -> String {
  switch type {
  case is User:
    return "user"
  case is ProductList:
    return "product_list"
  default:
    return ""
  }
}
