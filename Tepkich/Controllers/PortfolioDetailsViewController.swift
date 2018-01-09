//
//  PortfolioDetailsViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/9/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class PortfolioDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var item = CategoryItem()

    private let viewTitle = NSLocalizedString("Подкатегория", comment: "View title subcategory")
    private let reuseItentifierSubCatCell = "CatSubCatTableViewCell"
    private let segueIdentifierSubCatDetails = "subCatDetailsSegueIdentifier"
    
    private var ref: DatabaseReference!
    private var subItems = [SubCatItem]()
    
    enum dbReferences: String {
        case categoryId = "catId"
        case menuItems = "tb_menuItems"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewTitle
        
        removeBackButtonTextInChildsVC()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        ref.child(dbReferences.menuItems.rawValue).queryOrdered(byChild: dbReferences.categoryId.rawValue).queryEqual(toValue: item.key)
            .observe(
                .value,
                with: { snapshot in
                    guard snapshot.exists() else { return }
                    let dataDict = snapshot.children

                    var items = [SubCatItem]()
                    for item in dataDict {
                        let cateItem = SubCatItem(snapshot: item as! DataSnapshot)
                        items.append(cateItem)
                    }
                    self.subItems = items
                    self.tableView.reloadData()
            },
                withCancel: { error in
                    print(error.localizedDescription)
            }
        )
    }
    
    // MARK: - Navigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierSubCatDetails {
            let vc = segue.destination as! PortfolioSubCatDetailsViewController
            vc.subCatitem = sender as! SubCatItem
        }
    }
}

extension PortfolioDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let subCat = subItems[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseItentifierSubCatCell, for: indexPath) as! CatSubCatTableViewCell
        
        cell.subCatImageView.sd_setImage(
            with: URL(string: subCat.itemImage)!,
            placeholderImage: #imageLiteral(resourceName: "image_placeholder"),
            options: .retryFailed,
            completed: nil)
        
        cell.subCatNameLabel.text = subCat.itemName
        
        cell.subCatPriceLabel.text = "\(subCat.itemPrice) сом"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let subCat = subItems[row]
        
        performSegue(withIdentifier: segueIdentifierSubCatDetails, sender: subCat)
    }
}
