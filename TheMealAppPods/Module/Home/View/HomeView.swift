//
//  HomeView.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI
import Category
import MealCore
import Category
import Meal

struct HomeView: View {
    
    @ObservedObject var presenter: GetListPresenter<Any, CategoryDomainModel, Interactor<Any, [CategoryDomainModel], GetCategoriesRepository<GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoryTransformer>>>
    @EnvironmentObject var favoritePresenter: GetListPresenter<String, MealModel, Interactor<String, [MealModel], GetFavoriteMealsRepository<GetFavoriteMealsLocaleDataSource, MealsTransformer<MealTransformer<IngredientTransformer>>>>>
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.list.isEmpty {
                emptyCategories
            } else {
                content
            }
        }.onAppear {
            if self.presenter.list.count == 0 {
                self.presenter.getList(request: nil)
            }
        }.navigationBarItems(trailing: NavigationLink(destination: FavoriteView(presenter: favoritePresenter)) {
            Image(systemName: "heart")
                .font(.title)
            }.foregroundColor(.blue)
        ).navigationBarTitle(
            Text("Meals Apps"),
            displayMode: .automatic
        )
    }
    
}

extension HomeView {
    
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
    
    var emptyCategories: some View {
        CustomEmptyView(
            image: "assetNoFavorite",
            title: "The meal category is empty"
        ).offset(y: 80)
    }
    
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(
                self.presenter.list,
                id: \.id
            ) { category in
                ZStack {
                    linkBuilder(for: category) {
                        CategoryRow(category: category)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
            }
        }
    }
    
    func linkBuilder<Content: View>(
        for category: CategoryDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: HomeRouter().makeDetailView(for: category)
        ) { content() }
    }
}
