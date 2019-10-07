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
    var image: Imaging
    
    init(navigationController: UINavigationController?, image: Imaging) {
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
