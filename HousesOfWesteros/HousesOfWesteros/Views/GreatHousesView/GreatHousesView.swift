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
  var houses: [HouseBasic?]

  var body: some View {
    if houses.hasEntries {
      GeometryReader { geometry in
        NavigationView {
          List {
            ForEach(
              0..<Constants.greatHouses.count
            ) { index in
              if let unwrappedHouse = houses[index] {
                NavigationLink(
                  destination: SingleHouseView(houseBasic: unwrappedHouse)
                ) {
                  HouseCellLarge(house: unwrappedHouse, width: geometry.size.width - 16*2)
                }
                .buttonStyle(PlainButtonStyle())
              }
            }
          }
          .navigationTitle("Great Houses of Westeros")
        }
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
