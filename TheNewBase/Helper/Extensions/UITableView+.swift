//
//  UITableView+.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T>(ofType type: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as? T
    }
}
