//
//  BitcoinViewModel.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift

protocol BitcoinViewModeling: NetworkViewModeling {
    
    var bitcoin: PublishSubject<Bitcoin?> { get set }
    mutating func fetchBitcoinPrice()
}

struct BitcoinViewModel: ViewModeling, BitcoinViewModeling {

    var networking: Networking?
    var bitcoin = PublishSubject<Bitcoin?>()
    var disposeBag = DisposeBag()
    
    init(networking: Networking?) {
        self.networking = networking
    }
    
    func fetchBitcoinPrice() {
        let router = BitcoinRouter(params: [:])
        networking?.request(type: BitcoinResponse.self, urlRequest: router).subscribe(onNext: { response in
            self.handleResponse(response)
        }).disposed(by: disposeBag)
    }
    
    private func handleResponse(_ response: APIResponse) {
        switch response.result {
        case .success(let data):
            parseSuccessResponse(result: data)
        case .failure(let error):
            handleErrorResponse(error: error)
        }
    }
    
    private func parseSuccessResponse(result: Any?) {
        if let response = result as? BitcoinResponse {
            print("price: \(response.data.amount)")
            bitcoin.onNext(response.data)
        }
    }
    
    private func handleErrorResponse(error: Error) {
        
    }
}
