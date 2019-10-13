//
//  UIScrollView+.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/11/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import ObjectiveC

var RefreshControlView: UInt8 = 0

extension UIScrollView {
    
    var pullToRefreshControl: RefreshControl? {
        get {
            return objc_getAssociatedObject(self, &RefreshControlView) as? RefreshControl
        }
        set {
            objc_setAssociatedObject(self, &RefreshControlView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func addPullToRefresh(with actionHandle: @escaping () -> Void) {
        let refreshControl = RefreshControl()
        refreshControl.valueChangeActionHandle = actionHandle
        self.refreshControl = refreshControl
        self.pullToRefreshControl = refreshControl
    }
    
    func triggerPullToRefresh() {
        self.pullToRefreshControl?.beginRefreshing()
        self.pullToRefreshControl?.refreshControlValueChanged()
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        self.setContentOffset(desiredOffset, animated: true)
    }
    
    func stopPullToRefreshAnimating() {
        self.pullToRefreshControl?.endRefreshing()
    }
}

class RefreshControl: UIRefreshControl {
    
    var valueChangeActionHandle: (() -> Void)?
    
    override init() {
        super.init()
        self.addTarget(self, action: #selector(refreshControlValueChanged), for: UIControl.Event.valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshControlValueChanged() {
        self.beginRefreshing()
        valueChangeActionHandle?()
    }
}
