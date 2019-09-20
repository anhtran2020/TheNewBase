//
//  UIDevice+.swift
//  TheNewBase
//
//  Created by Anh Tran on 9/20/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var isiPhoneX: Bool {
        let screenRatio = UIScreen.main.nativeBounds.height / UIScreen.main.nativeBounds.width
        return self.userInterfaceIdiom == .phone && screenRatio > 1.8
    }
    
    var isiPhone: Bool {
        return self.userInterfaceIdiom == .phone
    }
    
    var hasTopNotch: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
}
