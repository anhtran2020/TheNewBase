//
//  ViewModelAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject

struct ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PixaImagesViewModeling.self) { resolver in
            let networking = resolver.resolve(Networking.self)
            let viewModel = PixaImagesViewModel(networking: networking)
            return viewModel
        }
    }
}
