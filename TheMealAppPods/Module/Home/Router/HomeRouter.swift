//
//  HomeRouter.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI
import Category
import Core
import Meal

class HomeRouter {
    func makeDetailView(for category: CategoryDomainModel) -> some View {
        
        let useCase: Interactor<
            String,
            [MealModel],
            GetMealsRepository<
                GetMealsLocaleDataSource,
                GetMealsRemoteDataSource,
                MealsTransformer<MealTransformer<IngredientTransformer>>>
        > = Injection.init().provideMeals()
        
        let presenter = GetListPresenter(useCase: useCase)
        
        return DetailView(presenter: presenter, category: category)
    }
}
