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
  
  private let viewTitle = "Great Houses of Westeros"
  
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
        if hasViableEntries {
          List {
            ForEach(houses, id: \.self) { house in
              if let unwrappedHouse = house {
                NavigationLink(
                  destination: SingleHouseView(houseBasic: unwrappedHouse)
                ) {
                  HouseCellLarge(house: unwrappedHouse, width: geometry.size.width - 16*2)
                }
                .buttonStyle(PlainButtonStyle())
              }
            }
          }
          .navigationTitle(viewTitle)
        } else {
          GreatHousesLoadingView(width: geometry.size.width - 16*2)
            .navigationTitle(viewTitle)
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
  }
}
