//
//  FirstCoordinator.swift
//  TheNewBase
//
//  Created by David Tran on 9/29/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import Swinject
import RxSwift

struct PixaImagesCoordinator: Coordinator {
    
    let window: UIWindow
    let disposeBag: DisposeBag
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.disposeBag = DisposeBag()
        self.navigationController = BaseNavigationController()
    }

    mutating func start() {
        guard let pixaImagesVC = Assembler.resolve(PixaImagesVC.self) else {
            return
        }
        
        navigationController = BaseNavigationController(rootViewController: pixaImagesVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        addObservers(of: pixaImagesVC)
    }
    
    func addObservers(of object: PixaImagesVC) {
        object.showImageDetailVC.asObserver().subscribe(onNext: { image in
            self.showDetail(of: image)
        }).disposed(by: disposeBag)
    }
    
    private func showDetail(of image: PixaImage) {
        let coordinator = PixaImageDetailCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
