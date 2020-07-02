//
//  ProductList.swift
//  WebServiceDemo
//
//  Created by Ravi Dhorajiya on 14/05/18.
//  Copyright © 2018 Ravi Dhorajiya. All rights reserved.
//

import Foundation

class ProductList: Codable {
  private enum CodingKeys: String, CodingKey {
    case id, price, status, name, description
    case categoryId = "category_id"
    case subCategoryId = "sub_category_id"
    case categoryName = "category_name"
    case subCategoryName = "sub_category_name"
    case brandName = "brand_name"
    case mediaNames = "media_names"
    case createdDate = "created_date"
  }
  let id: Int?
  let categoryId: Int?
  let subCategoryId: Int?
  let price: Int?
  let status: Int?
  let name: String?
  let description: String?
  let categoryName: String?
  let subCategoryName: String?
  let brandName: String?
  let mediaNames: String?
  let createdDate: String?
}
