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

class PixaImageDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var pixaImage: PixaImage?
    
    init(navigationController: UINavigationController?, image: PixaImage) {
        self.navigationController = navigationController
        self.pixaImage = image
    }

    func start() {
        guard let detailVC = Assembler.resolve(PixaImagesDetailVC.self) else {
            return
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
