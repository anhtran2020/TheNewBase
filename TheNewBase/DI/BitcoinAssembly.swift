//
//  BitcoinAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject

struct BitcoinAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(BitcoinViewController.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let bitcoinVC = storyboard.instantiateViewController(withIdentifier: BitcoinViewController.identifier) as! BitcoinViewController
            bitcoinVC.viewModel = resolver.resolve(BitcoinViewModeling.self)
            return bitcoinVC
        }
    }
}
