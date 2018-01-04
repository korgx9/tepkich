//
//  SideMenuTableViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/4/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        removeBackButtonTextInChildsVC()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
