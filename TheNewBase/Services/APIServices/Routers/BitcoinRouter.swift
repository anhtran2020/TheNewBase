//
//  BitcoinRouter.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Alamofire

struct BitcoinRouter: Requestable {
    
    var parameters: [String : Any]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return Address.Bitcoin.price
    }
    
    init(params: [String: Any]) {
        self.parameters = params
    }
}
