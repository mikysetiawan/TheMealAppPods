//
//  ContentView.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI
import Category
import Meal
import MealCore

struct ContentView: View {
    @EnvironmentObject var homePresenter: GetListPresenter<Any, CategoryDomainModel, Interactor<Any, [CategoryDomainModel], GetCategoriesRepository<GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoryTransformer>>>
    @EnvironmentObject var searchPresenter: SearchPresenter<MealModel, Interactor<String, [MealModel], SearchMealsRepository<GetMealsRemoteDataSource, MealsTransformer<MealTransformer<IngredientTransformer>>>>>

  var body: some View {
    TabView {
      NavigationView {
        HomeView(presenter: homePresenter)
      }.tabItem {
        TabItem(imageName: "house", title: "Home")
      }

      NavigationView {
        SearchView(presenter: searchPresenter)
      }.tabItem {
        TabItem(imageName: "magnifyingglass", title: "Search")
      }

      NavigationView {
        ProfileView()
      }.tabItem {
        TabItem(imageName: "person.crop.circle", title: "Account")
      }
    }
  }
}
