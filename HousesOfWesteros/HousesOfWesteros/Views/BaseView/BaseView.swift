//
//  BaseView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct BaseView: View {
  init() {
    for family in UIFont.familyNames.sorted() {
          let names = UIFont.fontNames(forFamilyName: family)
          print("Family: \(family) Font Names: \(names)")
        }
    
    // Set font for Title in large view
    UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 24)!]
    
    // Set font for Title in navigation bar
    UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 16)!]
  }
  
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
