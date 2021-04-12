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
    SingleHouseDisplay(
      houseUpdated: singleHouseViewModel.state.houseUpdated,
      showError: singleHouseViewModel.state.showError,
      updateData: singleHouseViewModel.getDataFromNestedLinks
    )
  }
}

struct SingleHouseDisplay: View {
  let houseUpdated: HouseUpdated?
  let showError: Bool
  let updateData: () -> Void
  
  var body: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        GeometryReader { geometry in
          VStack {
            HouseNameAndTitle(house: unwrappedHouseUpdated)
              // Move everything upwards to counter the
              // auto-padding in a NavigationView.
              .frame(width: geometry.size.width - 16*2, height: 10, alignment: .center)
              .offset(y: -20)
            
            Form {
              Group {
                CoatOfArmsSection(house: unwrappedHouseUpdated)
                HeraldryColorsSection(
                  house: unwrappedHouseUpdated,
                  width: geometry.size.width
                )
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
                AncestralWeaponsSection(house: unwrappedHouseUpdated)
                CadetBranchesSection(house: unwrappedHouseUpdated)
                SwornMembersSection(house: unwrappedHouseUpdated)
                ErrorSection(showError: showError, updateData: updateData)
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
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: MockClasses.houseUpdatedWithLinks,
          showError: true,
          updateData: {}
        )
      }
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: MockClasses.houseUpdatedWithoutLinks,
          showError: false,
          updateData: {}
        )
      }
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: nil,
          showError: false,
          updateData: {}
        )
      }
    }
  }
}
