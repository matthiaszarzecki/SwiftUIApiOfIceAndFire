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
  
  /// A boolean indicating whether houses
  /// contains at least 1 non-nil entry.
  var hasViableEntries: Bool {
    for house in houses {
      if house != nil {
        return true
      }
    }
    return false
  }
  
  var body: some View {
    GeometryReader { geometry in
      NavigationView {
        let title = "Great Houses of Westeros"
        
        if hasViableEntries {
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
          .navigationTitle(title)
        } else {
          GreatHousesLoadingView(width: geometry.size.width - 16*2)
            .navigationTitle(title)
        }
      }
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
    
    GreatHousesLoadingView(
      width: PreviewConstants.width
    )
  }
}
