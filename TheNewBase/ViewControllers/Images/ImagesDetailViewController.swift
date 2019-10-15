//
//  PixaImagesDetailVC.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/7/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import SDWebImage

class ImagesDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var viewModel: ImageDetailViewModeling?

    override func viewDidLoad() {
        super.viewDidLoad()

        configViews()
    }
    
    private func configViews() {
        guard let image = viewModel?.image else { return }
        self.title = image.tags
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        imageView.sd_setImage(with: URL(string: image.largeImageURL),
                              placeholderImage: UIImage(named: "ic_default"))
        usernameLabel.text = image.user
        typeLabel.text = image.type
        sizeLabel.text = "\(image.imageWidth) x \(image.imageHeight)"
    }

}
