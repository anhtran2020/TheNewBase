//
//  SearchImageRouter.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Alamofire

struct ImageRouter: Requestable {
    
    var parameters: [String : Any]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    init(params: [String: Any]) {
        self.parameters = params
    }
}

