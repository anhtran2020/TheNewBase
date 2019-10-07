//
//  Assembler+.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Swinject

extension Assembler {
    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler([NetworkAssembly(),
                                   ViewModelAssembly(),
                                   ImagesAssembly(),
                                   RouterAssembly()],
                                  container: container)
        return assembler
    }()
    
    static func resolve<T>(_ serviceType: T.Type) -> T? {
        return Assembler.shared.resolver.resolve(serviceType)
    }
    
    static func resolve<T, Arg1>(_ serviceType: T.Type, argument: Arg1) -> T? {
        return Assembler.shared.resolver.resolve(serviceType, argument: argument)
    }
}
