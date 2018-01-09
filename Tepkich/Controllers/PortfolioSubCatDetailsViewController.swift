//
//  PortfolioSubCatDetailsViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/9/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage

class PortfolioSubCatDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageSlideShowView: ImageSlideshow!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var subCatitem = SubCatItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = subCatitem.itemName
        
        nameLabel.text = subCatitem.itemName
        priceLabel.text = subCatitem.itemPrice + " сом"
        detailsLabel.text = subCatitem.itemDescription
        
        nameLabel.textColor = UIColor.orangeApp
        priceLabel.textColor = UIColor.orangeApp
        detailsLabel.textColor = UIColor.orangeApp
        
        imageSlideShowView.pageControlPosition = .hidden
        imageSlideShowView.contentScaleMode = .scaleAspectFill
        
        if let url = URL(string: subCatitem.itemImage) {
            var sdWebImageSource:[SDWebImageSource] = [SDWebImageSource]()
            
            sdWebImageSource.append(SDWebImageSource(url: url))
            imageSlideShowView.setImageInputs(sdWebImageSource)
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PortfolioSubCatDetailsViewController.didTap))
            imageSlideShowView.addGestureRecognizer(gestureRecognizer)
        }
        else {
            let imageSource = ImageSource(image: #imageLiteral(resourceName: "image_placeholder"))
            imageSlideShowView.setImageInputs([imageSource])
        }
    }
    
    @objc func didTap() {
        imageSlideShowView.presentFullScreenController(from: self)
    }
}
