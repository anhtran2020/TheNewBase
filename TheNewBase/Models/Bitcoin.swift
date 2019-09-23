//
//  Bitcoin.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation

struct BitcoinResponse: Codable {
    var data: Bitcoin
}

struct Bitcoin: Codable {
    var base: String
    var currency: String
    var amount: String
}
