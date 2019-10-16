//
//  PixaImageDetailCoordinator.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/7/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import Swinject
import RxSwift

class ImageDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var image: Imagination
    
    init(navigationController: UINavigationController?, image: Imagination) {
        self.navigationController = navigationController
        self.image = image
    }

    func start() {
        guard let detailVC = Assembler.resolve(ImagesDetailViewController.self, argument: image) else {
            return
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
