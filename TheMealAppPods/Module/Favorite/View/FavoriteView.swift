//
//  FavoriteView.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI
import Core
import Meal

struct FavoriteView: View {
    @ObservedObject var presenter: GetListPresenter<String, MealModel, Interactor<String, [MealModel], GetFavoriteMealsRepository<GetFavoriteMealsLocaleDataSource, MealsTransformer<MealTransformer<IngredientTransformer>>>>>
    
    var body: some View {
        ZStack {
            
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.list.count == 0 {
                emptyFavorites
            } else {
                content
            }
        }.onAppear {
            self.presenter.getList(request: nil)
        }.navigationBarTitle(
            Text("Favorite Meals"),
            displayMode: .automatic
        )
    }
    
}

extension FavoriteView {
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
    
    var errorIndicator: some View {
        CustomEmptyView(
            image: "assetSearchNotFound",
            title: presenter.errorMessage
        ).offset(y: 80)
    }
    
    var emptyFavorites: some View {
        CustomEmptyView(
            image: "assetNoFavorite",
            title: "Your favorite is empty"
        ).offset(y: 80)
    }
    
    var content: some View {
        ScrollView(
            .vertical,
            showsIndicators: false
        ) {
            ForEach(
                self.presenter.list,
                id: \.id
            ) { meal in
                ZStack {
                    self.linkBuilder(for: meal) {
                        FavoriteRow(meal: meal)
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
        }
    }
    
    func linkBuilder<Content: View>(
        for meal: MealModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        
        NavigationLink(
            destination: DetailRouter().makeMealView(for: meal)
        ) { content() }
    }
}
