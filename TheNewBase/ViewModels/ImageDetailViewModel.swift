//
//  PixaImageDetailViewModel.swift
//  TheNewBase
//
//  Created by David Tran on 10/7/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit

protocol ImageDetailViewModeling {
    var image: Imagination { get set }
    
    init(image: Imagination)
}

class ImageDetailViewModel: ImageDetailViewModeling {
    
    var image: Imagination
        
    required init(image: Imagination) {
        self.image = image
    }
}
