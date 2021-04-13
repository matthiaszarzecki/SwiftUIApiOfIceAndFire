//
//  View-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

extension View {
  func backgroundColor(_ color: Color) -> some View {
    return self.background(Rectangle().foregroundColor(color))
  }
}
