//
//  ViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 12/22/17.
//  Copyright © 2017 Kesh Pola. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    private var ref: DatabaseReference!
    
    enum dbReferences: String {
        case categories = "tbl_category"
        case writeDev = "tbl_writeDev"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        let categoriesRef = ref.child(dbReferences.categories.rawValue)
            .observe(
                .childChanged,
                with: { data in
                    debugPrint(data)
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
