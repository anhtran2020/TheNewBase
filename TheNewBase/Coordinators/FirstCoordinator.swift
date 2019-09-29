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

struct FirstCoordinator: Coordinator {
    
    let window: UIWindow
    let disposeBag: DisposeBag
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.disposeBag = DisposeBag()
        self.navigationController = BaseNavigationController()
    }

    mutating func start() {
        guard let firstVC = Assembler.resolve(FirstViewController.self) else {
            return
        }
        
        navigationController = BaseNavigationController(rootViewController: firstVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        addObservers(of: firstVC)
    }
    
    func addObservers(of object: FirstViewController) {
        object.showBitcoinController.asObserver().subscribe(onNext: { value in
            self.showBitcoinViewController()
        }).disposed(by: disposeBag)
    }
    
    func showBitcoinViewController() {
        let coordinator = BitcoinCoordinator(presenter: self.navigationController)
        coordinator.start()
    }
}
