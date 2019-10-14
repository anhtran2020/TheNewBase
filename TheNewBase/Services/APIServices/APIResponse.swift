//
//  APIResponse.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Alamofire

struct APIError: Error {
    
    init(response: DataResponse<Any>) {
        
    }
}

struct APIResponse {
    
    var result = Swift.Result<Any?, Error>.success(nil)
    
    init<T: Decodable>(type: T.Type, response: DataResponse<Any>) {
//        print("RESPONSE: \(response)")
        guard let value = response.data else {
            let error = APIError(response: response)
            result = .failure(error)
            return
        }
        let data = APIParser().parse(type: type, from: value)
        result = .success(data)
    }
    
    init(error: Error) {
        result = .failure(error)
    }
}

struct APIParser {
    
    func parse<T: Decodable>(type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
