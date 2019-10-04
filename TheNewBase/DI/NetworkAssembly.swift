//
//  NetworkAssembly.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject

struct NetworkAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(Networking.self) { resolver in
            return Network()
        }
    }
}
