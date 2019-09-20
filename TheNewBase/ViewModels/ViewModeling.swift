//
//  ViewModeling.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift

protocol ViewModeling {
    var disposeBag: DisposeBag { get }
}

protocol NetworkViewModeling {
    var networking: Networking? { get }
}

extension ViewModeling {
    var disposeBag: DisposeBag {
        return DisposeBag()
    }
}
