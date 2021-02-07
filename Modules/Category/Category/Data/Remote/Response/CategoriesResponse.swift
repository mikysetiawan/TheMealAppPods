//
//  CategoriesResponse.swift
//  Category
//
//  Created by Testing on 06/02/21.
//

import Foundation

public struct CategoriesResponse: Decodable {

  let categories: [CategoryResponse]
  
}

public struct CategoryResponse: Decodable {

  private enum CodingKeys: String, CodingKey {
    case id = "idCategory"
    case title = "strCategory"
    case image = "strCategoryThumb"
    case description = "strCategoryDescription"
  }

  let id: String?
  let title: String?
  let image: String?
  let description: String?

}
