//
//  ViewControlling.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import RxSwift

protocol ViewControlling {
    var disposeBag: DisposeBag { get set }
}
