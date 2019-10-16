//
//  Networking.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift
import Alamofire

protocol Networking {
    
    func request(urlRequest: Requestable) -> Observable<APIResponse>
    
    init()
}
