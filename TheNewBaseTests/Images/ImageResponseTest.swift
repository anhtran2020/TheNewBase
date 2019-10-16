//
//  ImageResponseTest.swift
//  TheNewBaseTests
//
//  Created by Anh Tran on 10/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import XCTest
@testable import TheNewBase

let imageResponseDict: [String: Any] = [
    "totalHits": 500,
    "total": 873682,
    "hits": [
      [
        "id": 4540013,
        "previewURL": "https://somewhere.com/page/",
        "tags": "a, b c, d ",
        "type": "photo",
        "user": "abc123",
        "largeImageURL": "https://somewhere.com/page/",
        "imageWidth": 2000,
        "imageHeight": 1000
      ]
    ]
]

class ImageResponseTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testParsePixaImageResponse() {
        let imageResponse = PixaImageResponse(fromDict: imageResponseDict)
        XCTAssertEqual(imageResponse.total, 873682)
        XCTAssertEqual(imageResponse.totalHits, 500)
        XCTAssertEqual(imageResponse.hits.count, 1)
        XCTAssertEqual(imageResponse.hits.first?.id, 4540013)
        XCTAssertEqual(imageResponse.hits.first?.previewURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.tags, "a, b c, d ")
        XCTAssertEqual(imageResponse.hits.first?.type, "photo")
        XCTAssertEqual(imageResponse.hits.first?.user, "abc123")
        XCTAssertEqual(imageResponse.hits.first?.largeImageURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.imageWidth, 2000)
        XCTAssertEqual(imageResponse.hits.first?.imageHeight, 1000)
    }
    
    func testParsePixaImageResponse_TagsIsNil() {
        var missingDict = imageResponseDict
        if var hits = missingDict["hits"] as? [[String: Any]] {
            hits[0]["tags"] = nil
            missingDict["hits"] = hits
        }
        let imageResponse = PixaImageResponse(fromDict: missingDict)
        XCTAssertEqual(imageResponse.total, 873682)
        XCTAssertEqual(imageResponse.totalHits, 500)
        XCTAssertEqual(imageResponse.hits.count, 1)
        XCTAssertEqual(imageResponse.hits.first?.id, 4540013)
        XCTAssertEqual(imageResponse.hits.first?.previewURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.tags, "")
        XCTAssertEqual(imageResponse.hits.first?.type, "photo")
        XCTAssertEqual(imageResponse.hits.first?.user, "abc123")
        XCTAssertEqual(imageResponse.hits.first?.largeImageURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.imageWidth, 2000)
        XCTAssertEqual(imageResponse.hits.first?.imageHeight, 1000)
    }
    
    func testParsePixaImageResponse_ExtraItem() {
        var missingDict = imageResponseDict
        missingDict["extraKey"] = "extra element"
        let imageResponse = PixaImageResponse(fromDict: missingDict)
        XCTAssertEqual(imageResponse.total, 873682)
        XCTAssertEqual(imageResponse.totalHits, 500)
        XCTAssertEqual(imageResponse.hits.count, 1)
        XCTAssertEqual(imageResponse.hits.first?.id, 4540013)
        XCTAssertEqual(imageResponse.hits.first?.previewURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.tags, "a, b c, d ")
        XCTAssertEqual(imageResponse.hits.first?.type, "photo")
        XCTAssertEqual(imageResponse.hits.first?.user, "abc123")
        XCTAssertEqual(imageResponse.hits.first?.largeImageURL, "https://somewhere.com/page/")
        XCTAssertEqual(imageResponse.hits.first?.imageWidth, 2000)
        XCTAssertEqual(imageResponse.hits.first?.imageHeight, 1000)
    }
}
