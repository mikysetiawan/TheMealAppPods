//
//  Color+Ext.swift
//  TheMealAppPods
//
//  Created by Testing on 06/02/21.
//

import SwiftUI

extension Color {

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
  
}
