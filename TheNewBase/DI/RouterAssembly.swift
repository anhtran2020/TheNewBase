//
//  RouterAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject

struct RouterAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ImageRouter.self) { (resolver: Resolver, parameters: [String: Any]) in
            return ImageRouter(params: parameters)
        }
    }
}
