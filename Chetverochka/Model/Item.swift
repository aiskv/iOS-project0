//
//  Item.swift
//  Chetverochka
//
//  Created by Andrey Skvortsov on 20.12.2021.
//

import Foundation
import UIKit

class Item {
    var id: String!
    var categoryId: String!
    var name: String!
    var description: String!
    var price: Double!
    var imageLinks: [String]!
    
    init() {
        
    }
    init(_dictionary: NSDictionary){
        id = _dictionary[kCATEGORYID] as? String
        name = _dictionary[kDESCRIPTION] as? String
        price = _dictionary[kPRICE] as? Double
        imageLinks = _dictionary[kIMAGELINKS] as? [String]
    }
}
