//
//  Network.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift
import Alamofire
import RxAlamofire

struct Network: Networking {
    
    init() {
        
    }

    func request<T: Decodable>(type: T.Type, urlRequest: Requestable) -> Observable<APIResponse> {
        return Observable.create({ observer in
            _ = self.SessionManager.rx.request(urlRequest: urlRequest).responseJSON().subscribe(onNext: { response in
                observer.onNext(APIResponse(type: type, response: response))
                observer.onCompleted()
            }, onError: { error in
                observer.onError(error)
            })
            
            return Disposables.create()
        })
    }
    
    let SessionManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [Address.domain: .disableEvaluation]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let man = Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return man
    }()
}
