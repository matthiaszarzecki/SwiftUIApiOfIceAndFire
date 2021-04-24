//
//  GreatHousesView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct GreatHousesView: View {
  @ObservedObject private var greatHousesViewModel = GreatHousesViewModel()
  
  var body: some View {
    GreatHousesDisplay(
      houses: greatHousesViewModel.state.houses
    )
  }
}

struct GreatHousesDisplay: View {
  var houses: [HouseBasic]
  
  var body: some View {
    if houses.hasEntries {
      NavigationView {
        List {
          ForEach(houses) { house in
            NavigationLink(
              destination: SingleHouseView(houseBasic: house)
            ) {
              HouseCellBasic(house: house, iconSize: 32)
            }
          }
        }
        .navigationTitle("Great Houses of Westeros")
      }
    } else {
      AllHousesLoadingView()
    }
  }
}

struct GreatHousesView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesDisplay(
      houses: MockClasses.housesBasic
    )
    
    GreatHousesDisplay(
      houses: [HouseBasic]()
    )
  }
}
