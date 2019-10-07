//
//  BitcoinAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject
import SwinjectStoryboard

struct PixaImagesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PixaImagesVC.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let pixaImagesVC = storyboard.instantiateViewController(ofType: PixaImagesVC.self)
            pixaImagesVC.viewModel = resolver.resolve(PixaImagesViewModeling.self)
            return pixaImagesVC
        }
        
        container.register(PixaImagesDetailVC.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let detailVC = storyboard.instantiateViewController(ofType: PixaImagesDetailVC.self)
//            detailVC.viewModel = resolver.resolve(PixaImagesViewModeling.self)
            return detailVC
        }
    }
}
