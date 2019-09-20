//
//  Requestable.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Alamofire

protocol Requestable: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get set }
    var headers: [String: String] { get }
    
    init(params: [String: Any])
}

extension Requestable {
    
    var headers: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded",
                "Authorization": ""]
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = createUrlRequest()
        if method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        
        printURLPretty(urlRequest)
        return urlRequest
    }
    
    private func createUrlRequest() -> URLRequest {
        let url = URL(string: Address.baseUrl)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 10
        urlRequest.allHTTPHeaderFields = headers
        print("========= HEADERS: \(String(describing: urlRequest.allHTTPHeaderFields))")
        return urlRequest
    }
    
    private func printURLPretty(_ urlRequest: URLRequest?) {
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
        print("Parameters: \(String(describing: parameters))")
        if let jsonBody = urlRequest?.httpBody {
            print("JSON: \(String(describing: String(data: jsonBody, encoding: .utf8)))")
        }
        print("URL: \(String(describing: urlRequest?.url?.absoluteString))")
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    }
}
