//
//  BitcoinAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject
import SwinjectStoryboard

struct ImagesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ImagesViewController.self) { resolver in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let pixaImagesVC = storyboard.instantiateViewController(ofType: ImagesViewController.self)
            pixaImagesVC.viewModel = resolver.resolve(ImagesViewModeling.self)
            return pixaImagesVC
        }
        
        container.register(ImagesDetailViewController.self) { (resolver: Resolver, image: Imaging) in
            let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
            let detailVC = storyboard.instantiateViewController(ofType: ImagesDetailViewController.self)
            detailVC.viewModel = resolver.resolve(ImageDetailViewModeling.self, argument: image)
            return detailVC
        }
    }
}
