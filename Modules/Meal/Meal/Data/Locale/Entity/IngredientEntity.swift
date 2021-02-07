//
//  IngredientEntity.swift
//  Meal
//
//  Created by Testing on 06/02/21.
//

import Foundation
import RealmSwift

public class IngredientEntity: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var idMeal: String = ""
    
}
