//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct ContentView: View {
  @State var houses: [House]? = nil
  
  var loader: some View {
    if let unwrappedHouses = houses {
      return AnyView(
        NavigationView {
          List {
            ForEach(unwrappedHouses, id: \.self) { house in
              NavigationLink(
                destination: HouseView(house: house)
              ) {
                Text("\(house.name)")
              }
            }
          }
          .navigationTitle("🛡️ GoT Houses🛡️ ")
        }
      )
    } else {
      return AnyView(
        Text("Loading")
      )
    }
  }
  
  var body: some View {
    loader
      .onAppear {
        Api.getHouses { houses in
          self.houses = houses
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView(houses: MockClasses.houses)
      ContentView()
    }
  }
}
