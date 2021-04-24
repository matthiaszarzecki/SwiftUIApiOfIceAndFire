//
//  BaseView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct BaseView: View {
  init() {
    // Set font for Title in large view
    UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 24)!]
    
    // Set font for Title in navigation bar
    UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 16)!]
  }
  
  var body: some View {
    TabView {
      GreatHousesView().tabItem {
        Label("Great Houses", systemImage: "shield.checkerboard")
      }
      
      AllHousesView()
        .tabItem {
          Label("All Houses", systemImage: "shield.lefthalf.fill")
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
