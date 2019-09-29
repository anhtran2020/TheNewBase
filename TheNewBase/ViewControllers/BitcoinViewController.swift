//
//  SecondViewController.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import RxSwift

class BitcoinViewController: BaseViewController {
    
    var viewModel: BitcoinViewModeling?

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchBitcoinPrice()
        addObservers()
    }
    
    private func addObservers() {
        viewModel?.bitcoin.asObservable().subscribe(onNext: { [weak self] bitcoin in
            self?.infoLabel.text = bitcoin?.amount
        }).disposed(by: disposeBag)
    }

}
