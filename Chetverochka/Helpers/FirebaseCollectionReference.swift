//
//  FirebaseCollectionReference.swift
//  Chetverochka
//
//  Created by Andrey Skvortsov on 20.12.2021.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) ->
CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
