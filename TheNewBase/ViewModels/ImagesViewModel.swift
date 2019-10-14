//
//  ImagesViewModel.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift
import Swinject

protocol ImagesViewModeling: NetworkViewModeling {
    
    var images: BehaviorSubject<[Imaging]> { get set }
    var errorMessage: PublishSubject<String> { get set }
    
    func refesh()
    func loadMore()
}

class ImagesViewModel: ViewModeling, ImagesViewModeling {

    var networking: Networking?
    var images = BehaviorSubject<[Imaging]>(value: [])
    var errorMessage = PublishSubject<String>()
    var disposeBag = DisposeBag()
    var pageNumber = 1
    
    init(networking: Networking?) {
        self.networking = networking
    }
    
    func refesh() {
        pageNumber = 1
        images.onNext([])
        fetchPixaImages()
    }
    
    func loadMore() {
        pageNumber += 1
        fetchPixaImages()
        print("Page number: \(pageNumber)")
    }
    
    private func fetchPixaImages() {
        let router = ImageRouter(paging: pageNumber)
        networking?.request(type: ImagesResponse.self, urlRequest: router).subscribe(onNext: { [weak self] response in
            self?.handleResponse(with: response.result)
        }, onError: { [weak self] error in
            self?.handleResponseError(error)
        }).disposed(by: disposeBag)
    }
    
    private func handleResponse(with result: Result<Any?, Error>) {
        switch result {
        case .success(let data):
            parseSuccessResponse(with: data)
        case .failure(let error):
            handleResponseError(error)
        }
    }
    
    private func parseSuccessResponse(with result: Any?) {
        if let response = result as? ImagesResponse {
            guard let values = images.value else {
                images.onNext(response.hits)
                return
            }
            images.onNext(values + response.hits)
        }
    }
    
    private func handleResponseError(_ error: Error) {
        let message = handleNetworkError(error: error)
        self.errorMessage.onNext(message)
    }
}
