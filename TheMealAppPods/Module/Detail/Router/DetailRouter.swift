//
//  DetailRouter.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI
import Category
import MealCore
import Meal

class DetailRouter {
    
    func makeMealView(for meal: MealModel) -> some View {
        let useCase: Interactor<
            String,
            MealModel,
            GetMealRepository<
                GetMealsLocaleDataSource,
                GetMealRemoteDataSource,
                MealTransformer<IngredientTransformer>>
        > = Injection.init().provideMeal()
        
        let favoriteUseCase: Interactor<
            String,
            MealModel,
            UpdateFavoriteMealRepository<
                GetFavoriteMealsLocaleDataSource,
                MealTransformer<IngredientTransformer>>
        > = Injection.init().provideUpdateFavorite()
        
        let presenter = MealPresenter(mealUseCase: useCase, favoriteUseCase: favoriteUseCase)
        
        return MealView(presenter: presenter, meal: meal)
    }
}
