//
//  UIViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/4/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func removeBackButtonTextInChildsVC() {
        self.parent?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
