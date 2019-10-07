//
//  PixaImageDetailViewModel.swift
//  TheNewBase
//
//  Created by David Tran on 10/7/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

protocol ImageDetailViewModeling {
    var image: Imaging { get set }
    
    init(image: Imaging)
}

class ImageDetailViewModel: ImageDetailViewModeling {
    
    var image: Imaging
        
    required init(image: Imaging) {
        self.image = image
    }
}
