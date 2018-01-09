//
//  SubCatItem.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/9/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SubCatItem {
    var catId = ""
    var itemDescription = ""
    var itemImage = ""
    var itemName = ""
    var itemPrice = ""
    var ref: DatabaseReference?

    init() {}
    
    init(snapshot: DataSnapshot) {
        catId = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        itemDescription = snapshotValue["itemDescription"] as! String
        itemImage = snapshotValue["itemImage"] as! String
        itemName = snapshotValue["itemName"] as! String
        itemPrice = snapshotValue["itemPrice"] as! String
        ref = snapshot.ref
    }
}
