//
//  GetFavoriteMealsRepository.swift
//  Meal
//
//  Created by Testing on 06/02/21.
//

import MealCore
import Combine

public struct GetFavoriteMealsRepository<
    MealLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
    MealLocaleDataSource.Request == String,
    MealLocaleDataSource.Response == MealEntity,
    Transformer.Request == String,
    Transformer.Response == [MealResponse],
    Transformer.Entity == [MealEntity],
    Transformer.Domain == [MealModel] {
    
    public typealias Request = String
    public typealias Response = [MealModel]
    
    private let _localeDataSource: MealLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: MealLocaleDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    public func execute(request: String?) -> AnyPublisher<[MealModel], Error> {
        return _localeDataSource.list(request: request)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
    }
}


