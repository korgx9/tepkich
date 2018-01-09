//
//  CatSubCatTableViewCell.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/9/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit

class CatSubCatTableViewCell: UITableViewCell {

    @IBOutlet weak var subCatImageView: UIImageView!
    @IBOutlet weak var subCatNameLabel: UILabel!
    @IBOutlet weak var subCatPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        subCatImageView.image = #imageLiteral(resourceName: "image_placeholder")
        subCatNameLabel.textColor = UIColor.orangeApp
        subCatPriceLabel.textColor = UIColor.orangeApp
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        subCatNameLabel.text = nil
        subCatPriceLabel.text = nil
    }
}
