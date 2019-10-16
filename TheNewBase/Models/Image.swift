//
//  Image.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Imagination {
    var id: Int { get set }
    var previewURL: String { get set }
    var tags: String { get set }
    var type: String { get set }
    var user: String { get set }
    var largeImageURL: String { get set }
    var imageWidth: Int { get set }
    var imageHeight: Int { get set }
    
    init(fromJson json: JSON)
}

protocol ImageResponse {
    var total: Int { get set }
    var totalHits: Int { get set }
    var hits: [Imagination] { get set }
    
    init(fromDict dict: [String: Any])
}

struct PixaImageResponse: ImageResponse {
    var total: Int
    var totalHits: Int
    var hits: [Imagination]
    
    init(fromDict dict: [String: Any]) {
        self.init(fromJson: JSON(dict))
    }
    
    init(fromJson json: JSON) {
        total = json["total"].intValue
        totalHits = json["totalHits"].intValue
        hits = json["hits"].arrayValue.map { PixaImage(fromJson: $0) }
    }
}

struct PixaImage: Imagination {
    var id: Int
    var tags: String
    var type: String
    var user: String
    var imageWidth: Int
    var imageHeight: Int
    var previewURL: String
    var largeImageURL: String
    
    init(fromJson json: JSON) {
        id = json["id"].intValue
        tags = json["tags"].stringValue
        type = json["type"].stringValue
        user = json["user"].stringValue
        imageWidth = json["imageWidth"].intValue
        imageHeight = json["imageHeight"].intValue
        previewURL = json["previewURL"].stringValue
        largeImageURL = json["largeImageURL"].stringValue
    }
}
