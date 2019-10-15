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

struct ImagesCoordinator: Coordinator {
    
    let window: UIWindow
    let disposeBag: DisposeBag
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.disposeBag = DisposeBag()
        self.navigationController = BaseNavigationController()
    }

    mutating func start() {
        guard let pixaImagesVC = Assembler.resolve(ImagesViewController.self) else {
            return
        }
        
        navigationController = BaseNavigationController(rootViewController: pixaImagesVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        addObservers(of: pixaImagesVC)
    }
    
    func addObservers(of object: ImagesViewController) {
        object.showImageDetailVC.asObserver().subscribe(onNext: { image in
            self.showDetail(of: image)
        }).disposed(by: disposeBag)
    }
    
    private func showDetail(of image: Imaging) {
        let coordinator = ImageDetailCoordinator(navigationController: navigationController, image: image)
        coordinator.start()
    }
}
