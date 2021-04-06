//
//  BaseView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct BaseView: View {
  var body: some View {
    TabView {
      AllHousesView()
        .tabItem {
          Label("Houses of Westeros", systemImage: "shield.checkerboard")
        }
      
      AboutView()
        .tabItem {
          Label("About", systemImage: "gear")
        }
    }
    .accentColor(.westerosRed)
  }
}

struct BaseView_Previews: PreviewProvider {
  static var previews: some View {
    BaseView()
  }
}
