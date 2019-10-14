//
//  UIScrollView+InfiniteScrolling.swift
//  TheNewBase
//
//  Created by David Tran on 10/11/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

var InfiniteScrollingViewKey: UInt8 = 0
let InfiniteScrollingViewHeight = CGFloat(60.0)

enum InfiniteScrollingState: Int {
    case loading = 0
    case triggered = 1
    case stopped = 2
}

extension UIScrollView {
    
    var infiniteScrollingView: InfiniteScrollingView? {
        get {
            return objc_getAssociatedObject(self, &InfiniteScrollingViewKey) as? InfiniteScrollingView
        }
        set {
            objc_setAssociatedObject(self, &InfiniteScrollingViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addInfiniteScrollingView(with handler: @escaping () -> Void) {
        let frame = CGRect(x: 0,
                           y: self.contentSize.height,
                           width: self.bounds.size.width,
                           height: InfiniteScrollingViewHeight)
        let infiniteView = InfiniteScrollingView(frame: frame,
                                                 scrollView: self,
                                                 originBottomInset: self.contentInset.bottom,
                                                 handler: handler)
        self.addSubview(infiniteView)
        self.infiniteScrollingView = infiniteView
    }
}

class InfiniteScrollingView: UIView {
    
    private var scrollView: UIScrollView?
    private var originBottomInset: CGFloat = 0
    private var infiniteScrollingHandler: (() -> Void)?
    private var disposeBag = DisposeBag()
    private var activityIndicator: UIActivityIndicatorView!
    private var state = BehaviorSubject<InfiniteScrollingState>(value: .stopped)
    
    init(frame: CGRect, scrollView: UIScrollView, originBottomInset: CGFloat, handler: (() -> Void)?) {
        super.init(frame: frame)
        self.isHidden = true
        self.scrollView = scrollView
        self.infiniteScrollingHandler = handler
        self.originBottomInset = originBottomInset
        self.setupActivityIndicator()
        self.addObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        activityIndicator.center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
    }
    
    private func addObservers() {
        scrollView?.rx.contentOffset.asObservable().subscribe(onNext: { [weak self] offset in
            self?.scrollViewDidScroll(contentOffset: offset)
        }).disposed(by: disposeBag)
        
        scrollView?.rx.contentSize.asObservable().subscribe(onNext: { [weak self] size in
            self?.setupInfiniteViewFrame()
            self?.setupContentInset()
        }).disposed(by: disposeBag)
        
        state.asObserver().subscribe(onNext: { [weak self] state in
            self?.setupInfiniteView(with: state)
        }).disposed(by: disposeBag)
    }
    
    func stopAnimating() {
        state.onNext(.stopped)
    }
    
    private func setupInfiniteView(with state: InfiniteScrollingState) {
        switch state {
        case .loading, .triggered:
            self.isHidden = false
            activityIndicator.startAnimating()
        case .stopped:
            self.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    private func setupInfiniteViewFrame() {
        guard let scrollView = self.scrollView else { return }
        self.layoutSubviews()
        self.frame = CGRect(x: 0,
                       y: scrollView.contentSize.height,
                       width: scrollView.bounds.size.width,
                       height: InfiniteScrollingViewHeight)
    }
    
    private func setupContentInset() {
        guard var currentInset = scrollView?.contentInset else { return }
        currentInset.bottom = originBottomInset + InfiniteScrollingViewHeight
        scrollView?.contentInset = currentInset
    }
    
    private func setupActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
    }
    
    private func scrollViewDidScroll(contentOffset: CGPoint) {
        guard let scrollView = self.scrollView else { return }
        let scrollViewContentHeight = scrollView.contentSize.height
        let scrollViewOffsetThreshold = scrollViewContentHeight - scrollView.bounds.size.height
        
        let previusState = state.value
        
        if scrollView.isDragging && state.value == .triggered {
            state.onNext(.loading)
        } else if contentOffset.y > scrollViewOffsetThreshold && scrollView.isDragging &&
            state.value == .stopped {
            state.onNext(.triggered)
        } else if contentOffset.y < scrollViewOffsetThreshold && state.value != .stopped {
            state.onNext(.stopped)
        }
                
        if state.value == .loading && previusState == .triggered {
            infiniteScrollingHandler?()
        }
    }
}
