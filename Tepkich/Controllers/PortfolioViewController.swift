//
//  PortfolioViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/4/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewTitle = NSLocalizedString("Портфолио", comment: "View title portfolio")
    private let reuseIdentifierCatItemCell = "CatItemCollectionViewCell"
    private let placeholderImage = #imageLiteral(resourceName: "image_placeholder")
    
    private var ref: DatabaseReference!
    private var items = [CategoryItem]()
    
    enum dbReferences: String {
        case categories = "tbl_category"
        case menuItems = "tb_menuItems"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewTitle
        removeBackButtonTextInChildsVC()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        ref = Database.database().reference()
        ref.child(dbReferences.categories.rawValue)
            .observe(
                .value,
                with: { snapshot in
                    guard snapshot.exists() else { return }
                    let dataDict = snapshot.children
                    
                    var items = [CategoryItem]()
                    for item in dataDict {
                        let cateItem = CategoryItem(snapshot: item as! DataSnapshot)
                        items.append(cateItem)
                    }
                    self.items = items
                    self.collectionView.reloadData()
            },
                withCancel: { error in
                    print(error.localizedDescription)
            }
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        ref.removeAllObservers()
    }
}

extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        let cateItem = items[row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCatItemCell, for: indexPath) as! CatItemCollectionViewCell
        cell.catNameLabel.text = cateItem.name
        cell.catImageView.sd_setImage(with: URL(string: cateItem.image),
                                      placeholderImage: placeholderImage,
                                      options: .scaleDownLargeImages,
                                      completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let cateItem = items[row]

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = UIScreen.main.bounds.size.width
        return CGSize(width: width * 0.5, height: 120)
    }
}
