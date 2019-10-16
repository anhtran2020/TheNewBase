//
//  APIResponse.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Alamofire

struct APIResponse {
    
    var result = Swift.Result<[String: Any]?, Error>.success(nil)
    
    init(response: DataResponse<Any>) {
//        print("RESPONSE: \(response)")
        switch response.result {
        case .success(let value):
            result = .success(value as? [String: Any])
        case .failure(let error):
            result = .failure(error)
        }
    }
    
    init(error: Error) {
        result = .failure(error)
    }
}
