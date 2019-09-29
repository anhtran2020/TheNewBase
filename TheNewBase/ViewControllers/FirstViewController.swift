//
//  FirstViewController.swift
//  TheNewBase
//
//  Created by David Tran on 9/29/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import RxSwift

class FirstViewController: BaseViewController {
    
    var showBitcoinController = PublishSubject<Bool>()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func priceButtonTapped(_ sender: Any) {
        showBitcoinController.onNext(true)
    }

}
