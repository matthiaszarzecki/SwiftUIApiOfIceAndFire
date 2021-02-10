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
          VStack {
            HouseNameAndTitle(house: unwrappedHouseUpdated)
            Form {
              Group {
                CoatOfArmsSection(house: unwrappedHouseUpdated)
                HouseMottoSection(house: unwrappedHouseUpdated)
                TitlesSection(house: unwrappedHouseUpdated)
                SeatsSection(house: unwrappedHouseUpdated)
                CurrentLordSection(house: unwrappedHouseUpdated)
                CurrentHeirSection(house: unwrappedHouseUpdated)
              }
              Group {
                OverlordHouseSection(house: unwrappedHouseUpdated)
                FoundedSection(house: unwrappedHouseUpdated)
                FounderSection(house: unwrappedHouseUpdated)
                DiedOutSection(house: unwrappedHouseUpdated)
                CadetBranchesSection(house: unwrappedHouseUpdated)
                SwornMembersSection(house: unwrappedHouseUpdated)
                AncestralWeaponsSection(house: unwrappedHouseUpdated)
              }
            }
          }
        }
      )
    } else {
      return AnyView(
        SingleHouseLoadingView()
      )
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
