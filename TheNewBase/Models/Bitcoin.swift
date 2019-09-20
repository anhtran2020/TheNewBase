//
//  Bitcoin.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation

struct Bitcoin: Codable {
    var data: Info
}

struct Info: Codable {
    var base: String
    var currency: String
    var amount: String
}
