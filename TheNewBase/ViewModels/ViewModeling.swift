//
//  ViewModeling.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift

protocol ViewModeling {
    
}

protocol NetworkViewModeling {
    var networking: Networking? { get }
}

extension ViewModeling {
    
    func handleNetworkError(error: Error) -> String {
        let error = NetworkError(error: error as NSError)
        var message = ""
        switch error {
        case .notConnectedToInternet:
            message = "Not connected to internet"
        case .notReachedServer:
            message = "Not reached server"
        case .connectionLost:
            message = "Connection lost"
        case .incorrectDataReturned:
            message = "Incorrect data returned"
        default:
            message = "Unknown error"
        }
        return message
    }
}
