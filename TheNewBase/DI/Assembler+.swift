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
                                   BitcoinAssembly()],
                                  container: container)
        return assembler
    }()
}
