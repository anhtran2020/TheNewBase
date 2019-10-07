//
//  Image.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation

protocol Imaging {
    var previewURL: String { get set }
    var tags: String { get set }
    var type: String { get set }
}

struct ImagesResponse: Codable {
    var total: Int
    var totalHits: Int
    var hits: [PixaImage]
}

struct PixaImage: Codable, Imaging {
//    var id: String
    var previewURL: String
    var tags: String
    var type: String
}
