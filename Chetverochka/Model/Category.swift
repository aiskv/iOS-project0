//
//  Category.swift
//  Chetverochka
//
//  Created by Andrey Skvortsov on 20.12.2021.
//

import Foundation
import UIKit

class Category {
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as! String
        name = _dictionary[kNAME] as! String
        image = UIImage(named: _dictionary[kIMAGENAME] as? String ?? "")
    }
}
//MARK: Download category from firebase

func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void) {
    var categoryArray: [Category] = []
    
    FirebaseReference(.Category).getDocuments{ (snapshot, error) in
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        
        if !snapshot.isEmpty {
            
            for categoryDict in snapshot.documents {
                print("created new category")
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
            }
        }
        completion(categoryArray)
    }
}
//MARK: Save category function

func saveCategoryToFirebase(_ category: Category) {
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String: Any])
        
}

//Mark: Helpers

func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys:[kOBJECTID as NSCopying, kNAME as NSCopying, kIMAGENAME as NSCopying] )
}

// Onetime use category declaration
//func createCategorySet(){
//    let meatProducts = Category(_name: "Meat products", _imageName: "meatProducts")
//    let dairyProducts = Category(_name: "Dairy products", _imageName: "dairyProducts")
//    let fruitsAndVegetables = Category(_name: "Fruits and Vegetables", _imageName: "fruitsAndVegetables")
//    let breadAndPastry = Category(_name: "Bread and Pastry", _imageName: "breadAndPastry")
//    let sweats = Category(_name: "Sweats", _imageName: "sweats")
//    let fish = Category(_name: "Fish", _imageName: "fish")
//    let teaAndCoffee = Category(_name: "Tea and Coffee", _imageName: "teaAndCoffee")
//    let preparedMeals = Category(_name: "Prepared Meals", _imageName: "preparedMeals")
//
//    let arrayOfCategories = [meatProducts,dairyProducts,fruitsAndVegetables,breadAndPastry,sweats,fish,teaAndCoffee, preparedMeals]
//
//    for category in arrayOfCategories{
//        saveCategoryToFirebase(category)
//    }
//}
