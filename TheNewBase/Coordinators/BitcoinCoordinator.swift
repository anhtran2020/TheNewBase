//
//  BitcoinCoordinator.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/27/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import Swinject

struct BitcoinCoordinator: Coordinator {
    
    let navigationController: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.navigationController = presenter
    }

    func start() {
        guard let bitcoinVC = Assembler.resolve(BitcoinViewController.self) else {
            return
        }
        bitcoinVC.viewModel = Assembler.resolve(BitcoinViewModeling.self, argument: "aaaaaa")
            //Assembler.resolve(BitcoinViewModeling.self)
        navigationController?.pushViewController(bitcoinVC, animated: true)
    }
}
