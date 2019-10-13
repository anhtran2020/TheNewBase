//
//  Image.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation

protocol Imaging: Codable {
    var id: Int { get set }
    var previewURL: String { get set }
    var tags: String { get set }
    var type: String { get set }
    var user: String { get set }
    var largeImageURL: String { get set }
    var imageWidth: Int { get set }
    var imageHeight: Int { get set }
}

struct ImagesResponse: Codable {
    var total: Int
    var totalHits: Int
    var hits: [PixaImage]
}

struct PixaImage: Imaging {
    var id: Int
    var previewURL: String
    var tags: String
    var type: String
    var user: String
    var largeImageURL: String
    var imageWidth: Int
    var imageHeight: Int
}
