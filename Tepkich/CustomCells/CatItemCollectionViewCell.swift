//
//  CatItemCollectionViewCell.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/9/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit

class CatItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    
    private let placeholderImage = #imageLiteral(resourceName: "image_placeholder")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        catNameLabel.textColor = UIColor.orangeApp
        catImageView.image = placeholderImage
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catNameLabel.text = nil
        catImageView.image = placeholderImage
    }
}
