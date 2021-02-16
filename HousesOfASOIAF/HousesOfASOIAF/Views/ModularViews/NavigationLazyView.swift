//
//  NavigationLazyView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 16.02.21.
//

import SwiftUI

/// Wraps around the destination in a NavigationLink, which otherwise
/// would load the view before it would actually have to be shown.
struct NavigationLazyView<Content: View>: View {
  let build: () -> Content
  
  init(_ build: @autoclosure @escaping () -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}
