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
        container.register(ImagesViewModeling.self) { resolver in
            let networking = resolver.resolve(Networking.self)
            let viewModel = ImagesViewModel(networking: networking)
            return viewModel
        }
        
        container.register(ImageDetailViewModeling.self) { (resolver: Resolver, image: Imaging) in
            return ImageDetailViewModel(image: image)
        }
    }
}
