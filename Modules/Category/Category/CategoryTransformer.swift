//
//  CategoryTransformer.swift
//  Category
//
//  Created by Testing on 06/02/21.
//

import Foundation
import MealCore

public struct CategoryTransformer: Mapper {
    public typealias Request = Any
    public typealias Response = [CategoryResponse]
    public typealias Entity = [CategoryModuleEntity]
    public typealias Domain = [CategoryDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(request: Any?, response: [CategoryResponse]) -> [CategoryModuleEntity] {
        return response.map { result in
          let newCategory = CategoryModuleEntity()
          newCategory.id = result.id ?? ""
          newCategory.title = result.title ?? "Unknow"
          newCategory.image = result.image ?? "Unknow"
          newCategory.desc = result.description ?? "Unknow"
          return newCategory
        }
    }
    
    public func transformEntityToDomain(entity: [CategoryModuleEntity]) -> [CategoryDomainModel] {
        return entity.map { result in
          return CategoryDomainModel(
            id: result.id,
            title: result.title,
            image: result.image,
            description: result.desc
          )
        }
    }
}
