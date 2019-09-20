//
//  UIStoryboard+.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

extension UIStoryboard {
    // swiftlint:disable force_cast
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
