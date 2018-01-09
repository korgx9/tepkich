//
//  CategoryItem.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/5/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct CategoryItem {
    
    var name = ""
    var image = ""
    var key = ""
    var ref: DatabaseReference?
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        name = snapshotValue["cat_name"] as! String
        image = snapshotValue["cat_image"] as! String
        ref = snapshot.ref
    }
}
