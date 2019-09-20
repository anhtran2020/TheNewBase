//
//  AppContainer.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

struct AppContainer {

    static let shared = AppContainer()
    let container = Container()
    
    private init() {
        
    }
    
    private func setupContainer() {
    
    }
}

struct NetworkAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(Networking.self) { resolver in
            return Network(token: "")
        }
    }
}

struct ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(BitcoinViewModeling.self) { resolver in
            let networking = resolver.resolve(Networking.self)
            let viewModel = BitcoinViewModel(networking: networking)
            return viewModel
        }
    }
}

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

extension Assembler {
    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler([NetworkAssembly(),
                                   ViewModelAssembly(),
                                   BitcoinAssembly()],
                                  container: container)
        return assembler
    }()
}
