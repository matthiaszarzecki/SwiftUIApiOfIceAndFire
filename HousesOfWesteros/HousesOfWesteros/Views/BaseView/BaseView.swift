//
//  BaseView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct BaseView: View {
  @State private var selection = 0

  @State private var resetNavigationIDForGreatHousesView = UUID()

  var handler: Binding<Int> { Binding(
    get: { self.selection },
    set: {
      if $0 == self.selection {
        if $0 == 0 {
          // Reset great houses view
          print("asdasdas")
          self.resetNavigationIDForGreatHousesView = UUID()
        }
      }
      self.selection = $0
    }
  )}

  init() {
    // Set font for Title in large view
    if let font = UIFont(name: "GameofThrones", size: 20) {
      UINavigationBar.appearance().largeTitleTextAttributes = [.font : font]
    }


    // Set font for Title in navigation bar
    if let font = UIFont(name: "GameofThrones", size: 16) {
      UINavigationBar.appearance().titleTextAttributes = [.font : font]
    }
  }
  
  var body: some View {
    TabView(selection: handler) {
      GreatHousesView()
        .tabItem {
          Label(
            "Great Houses",
            systemImage: "shield.checkerboard"
          )
        }
        .id(resetNavigationIDForGreatHousesView)
      
      AllHousesView()
        .tabItem {
          Label(
            "All Houses",
            systemImage: "shield.lefthalf.fill"
          )
        }
        .tag(1)
      
      AboutView()
        .tabItem {
          Label(
            "About",
            systemImage: "gear"
          )
        }
        .tag(2)
    }
    .accentColor(.westerosRed)
  }
}

struct BaseView_Previews: PreviewProvider {
  static var previews: some View {
    BaseView()
  }
}
