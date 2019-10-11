//
//  PixaImagaCell.swift
//  TheNewBase
//
//  Created by Anh Tran on 10/4/19.
//  Copyright © 2019 Anh Tran. All rights reserved.
//

import UIKit
import SDWebImage

class PixaImagaCell: UITableViewCell {
    
    @IBOutlet weak var pixaImageView: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(with image: Imaging) {
        pixaImageView.sd_setImage(with: URL(string: image.previewURL),
                                  placeholderImage: UIImage(named: "ic_default"))
        tagsLabel.text = image.tags
        typeLabel.text = "\(image.imageWidth) x \(image.imageHeight)"
    }

}
