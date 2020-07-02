//
//  ViewController.swift
//  TestProject
//
//  Created by Platform Development on 2020/06/17.
//  Copyright © 2020 Platform Development. All rights reserved.
//

import UIKit
import Alamofire

@available(iOS 13.0, *)

struct Config { static let baseURL = "https://jsonplaceholder.typicode.com" }

class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    // MARK: - Buttons
    @IBAction func tappedGetButton(_ sender: Any) {
      
    }
    
    @IBAction func tappedPostButton(_ sender: Any) {
      let parameters: [String: Any] = ["facebook_id": "123456789",
                                        "gender": 1,
                                        "device_type": 0,
                                        "device_token": ""]
      WebServiceManager.shared.callWebService(loginURL, parameters: parameters, method: .post) { (response: [User]?, error, errorMessage)  in
        print(response?.count ?? 0)
      }
    }
    
    @IBAction func tappedPost2Button(_ sender: Any) {
      let parameters: [String: Any] = ["user_id": "1",
                                        "limit": 5,
                                        "offset": 0,
                                        "category_id": 1,
                                        "sub_category_ids": "1,2",
                                        "min_price": 0,
                                        "max_price": 1000]
      WebServiceManager.shared.callWebService(getProductListURL, parameters: parameters, method: .post) { (response: [ProductList]?, error, errorMessage)  in
        print(response?.count ?? 0)
      }
    }
    
}

