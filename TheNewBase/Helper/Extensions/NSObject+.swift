//
//  NSObject+.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/16/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func propertyNames() -> [String] {
        var results = [String]()

        var count = UInt32(0)
        let myClass: AnyClass = self.classForCoder
        guard let properties = class_copyPropertyList(myClass, &count) else { return [] }

        for i in 0..<count {
            let property = properties[Int(i)]
            let cname = property_getName(property)
            let name = String(cString: cname)
            results.append(name)
        }

        free(properties)

        return results
    }
}
