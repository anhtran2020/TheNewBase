//
//  AppCoordinator.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/27/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import Swinject

struct AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        var firstCoordinator = ImagesCoordinator(window: window)
        firstCoordinator.start()
    }
}
