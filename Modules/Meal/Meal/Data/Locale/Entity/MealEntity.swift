//
//  MealEntity.swift
//  Meal
//
//  Created by Testing on 06/02/21.
//

import Foundation
import RealmSwift

public class MealEntity: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var image = ""
    @objc dynamic var category = ""
    @objc dynamic var area = ""
    @objc dynamic var instructions = ""
    @objc dynamic var tag = ""
    @objc dynamic var youtube = ""
    @objc dynamic var source = ""
    @objc dynamic var favorite = false
    
    var ingredients = List<IngredientEntity>()
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
