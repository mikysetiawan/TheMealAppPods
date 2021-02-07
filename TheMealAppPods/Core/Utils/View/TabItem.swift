//
//  TabItem.swift
//  MealsApps
//
//  Created by Testing on 24/08/20.
//

import SwiftUI

struct TabItem: View {

  var imageName: String
  var title: String
  var body: some View {
    VStack {
      Image(systemName: imageName)
      Text(title)
    }
  }

}
