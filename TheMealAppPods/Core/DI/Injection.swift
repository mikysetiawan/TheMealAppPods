//
//  Injection.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import Foundation
import RealmSwift
import MealCore
import Category
import UIKit
import Meal

final class Injection: NSObject {
  
    // 1
    func provideCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryDomainModel] {
        // 2
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        // 3
        let locale = GetCategoriesLocaleDataSource(realm: appDelegate.realm)
            
        // 4
        let remote = GetCategoriesRemoteDataSource(endpoint: Endpoints.Gets.categories.url)
            
        // 5
        let mapper = CategoryTransformer()
            
        // 6
        let repository = GetCategoriesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
            
        // 7
        return Interactor(repository: repository) as! U
    }
    
    func provideMeals<U: UseCase>() -> U where U.Request == String, U.Response == [MealModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let locale = GetMealsLocaleDataSource(realm: appDelegate.realm)
        
        let remote = GetMealsRemoteDataSource(endpoint: Endpoints.Gets.meals.url)
        
        let ingredientMapper = IngredientTransformer()
        let mealMapper = MealTransformer(ingredientMapper: ingredientMapper)
        let mapper = MealsTransformer(mealMapper: mealMapper)
        
        let repository = GetMealsRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
        
        return Interactor(repository: repository) as! U
    }
    
    func provideSearch<U: UseCase>() -> U where U.Request == String, U.Response == [MealModel] {
        let remote = GetMealsRemoteDataSource(endpoint: Endpoints.Gets.search.url)
        
        let ingredientMapper = IngredientTransformer()
        let mealMapper = MealTransformer(ingredientMapper: ingredientMapper)
        let mapper = MealsTransformer(mealMapper: mealMapper)
        
        let repository = SearchMealsRepository(
            remoteDataSource: remote,
            mapper: mapper)
        
        return Interactor(repository: repository) as! U
    }
    
    func provideMeal<U: UseCase>() -> U where U.Request == String, U.Response == MealModel {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let locale = GetMealsLocaleDataSource(realm: appDelegate.realm)
        
        let remote = GetMealRemoteDataSource(endpoint: Endpoints.Gets.meal.url)
        
        let ingredientMapper = IngredientTransformer()
        let mapper = MealTransformer(ingredientMapper: ingredientMapper)
        
        let repository = GetMealRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
        
        return Interactor(repository: repository) as! U
    }
    
    func provideUpdateFavorite<U: UseCase>() -> U where U.Request == String, U.Response == MealModel {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let locale = GetFavoriteMealsLocaleDataSource(realm: appDelegate.realm)
        
        let ingredientMapper = IngredientTransformer()
        let mapper = MealTransformer(ingredientMapper: ingredientMapper)
        
        let repository = UpdateFavoriteMealRepository(
            localeDataSource: locale,
            mapper: mapper)
        
        return Interactor(repository: repository) as! U
    }
    
    func provideFavorite<U: UseCase>() -> U where U.Request == String, U.Response == [MealModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let locale = GetFavoriteMealsLocaleDataSource(realm: appDelegate.realm)
        
        let ingredientMapper = IngredientTransformer()
        let mealMapper = MealTransformer(ingredientMapper: ingredientMapper)
        let mapper = MealsTransformer(mealMapper: mealMapper)
        
        let repository = GetFavoriteMealsRepository(
            localeDataSource: locale,
            mapper: mapper)
        
        return Interactor(repository: repository) as! U
    }
}
