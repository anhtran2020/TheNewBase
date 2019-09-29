//
//  BitcoinAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject
import SwinjectStoryboard

struct BitcoinAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(FirstViewController.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let firstVC = storyboard.instantiateViewController(ofType: FirstViewController.self)
            return firstVC
        }
        
        container.register(BitcoinViewController.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let bitcoinVC = storyboard.instantiateViewController(withIdentifier: BitcoinViewController.identifier) as! BitcoinViewController
            bitcoinVC.viewModel = resolver.resolve(BitcoinViewModeling.self)
            return bitcoinVC
        }
    }
}
