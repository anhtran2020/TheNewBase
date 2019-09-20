//
//  ViewController.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func priceButtonTapped(_ sender: Any) {
        if let bitcoinVC = Assembler.shared.resolver.resolve(BitcoinViewController.self) {
            self.navigationController?.pushViewController(bitcoinVC, animated: true)
        }
    }
}

