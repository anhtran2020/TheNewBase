//
//  UIViewController+.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/19/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
}
