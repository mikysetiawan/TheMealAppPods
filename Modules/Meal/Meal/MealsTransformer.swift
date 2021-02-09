//
//  MealsTransformer.swift
//  Meal
//
//  Created by Testing on 06/02/21.
//

import MealCore

public struct MealsTransformer<MealMapper: Mapper>: Mapper
where
    MealMapper.Request == String,
    MealMapper.Response == MealResponse,
    MealMapper.Entity == MealEntity,
    MealMapper.Domain == MealModel {
    
    public typealias Request = String
    public typealias Response = [MealResponse]
    public typealias Entity = [MealEntity]
    public typealias Domain = [MealModel]
    
    private let _mealMapper: MealMapper
    
    public init(mealMapper: MealMapper) {
        _mealMapper = mealMapper
    }
    
    public func transformResponseToEntity(request: String?, response: [MealResponse]) -> [MealEntity] {
        return response.map { result in
            _mealMapper.transformResponseToEntity(request: request, response: result)
        }
    }
    
    public func transformEntityToDomain(entity: [MealEntity]) -> [MealModel] {
        return entity.map { result in
            return _mealMapper.transformEntityToDomain(entity: result)
        }
    }
}

