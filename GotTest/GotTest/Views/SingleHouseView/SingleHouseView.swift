//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows information about the specified House.
struct SingleHouseView: View {
  @ObservedObject private var singleHouseViewModel: SingleHouseViewModel
  
  init(houseBasic: HouseBasic) {
    singleHouseViewModel = SingleHouseViewModel(houseBasic: houseBasic)
  }
  
  var body: some View {
    SingleHouseDisplay(houseUpdated: singleHouseViewModel.state.houseUpdated)
  }
}

struct SingleHouseDisplay: View {
  let houseUpdated: HouseUpdated?
  
  var body: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        GeometryReader { geometry in
          ScrollView(showsIndicators: false) {
            Group {
              HouseNameAndTitle(house: unwrappedHouseUpdated)
              CoatOfArms(house: unwrappedHouseUpdated)
              HouseMotto(house: unwrappedHouseUpdated)
              Titles(house: unwrappedHouseUpdated)
              Seats(house: unwrappedHouseUpdated)
              CurrentLord(house: unwrappedHouseUpdated)
              Heir(house: unwrappedHouseUpdated)
            }
            Group {
              OverlordHouse(house: unwrappedHouseUpdated)
              Founded(house: unwrappedHouseUpdated)
              Founder(house: unwrappedHouseUpdated)
              DiedOut(house: unwrappedHouseUpdated)
              AncestralWeapons(house: unwrappedHouseUpdated)
              CadetBranches(house: unwrappedHouseUpdated)
              SwornMembers(house: unwrappedHouseUpdated)
            }
          }
          .frame(width: geometry.size.width, alignment: .center)
        }
      )
    } else {
      return AnyView(Text("Loading"))
    }
  }
}

struct SingleHouseDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SingleHouseDisplay(houseUpdated: MockClasses.houseUpdatedWithLinks)
      SingleHouseDisplay(houseUpdated: MockClasses.houseUpdatedWithoutLinks)
      SingleHouseDisplay(houseUpdated: nil)
    }
  }
}
