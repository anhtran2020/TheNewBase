//
//  SecondViewController.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import RxSwift

class BitcoinViewController: UIViewController, ViewControlling {
    
    var disposeBag = DisposeBag()
    var viewModel: BitcoinViewModeling?

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchBitcoinPrice()
        addObservers()
    }
    
    private func addObservers() {
        viewModel?.info.asObservable().subscribe(onNext: { [weak self] bitcoin in
            self?.infoLabel.text = bitcoin?.data.amount
        }).disposed(by: disposeBag)
    }

}