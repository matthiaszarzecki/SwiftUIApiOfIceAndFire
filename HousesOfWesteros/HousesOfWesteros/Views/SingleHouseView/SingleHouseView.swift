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

  @ViewBuilder
  var body: some View {
    GeometryReader { geometry in
      if let unwrappedHouseUpdated = houseUpdated {
        VStack {
          HouseNameAndTitle(
            house: unwrappedHouseUpdated,
            width: geometry.size.width - .spacing16 * 2
          )

          Form {
            Group {
              CoatOfArmsSection(house: unwrappedHouseUpdated)

              if !unwrappedHouseUpdated.isGreatHouse {
                HeraldryColorsSection(
                  house: unwrappedHouseUpdated,
                  width: geometry.size.width
                )
              }

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
      } else {
        SingleHouseLoadingView()
      }
    }
  }
}

#if !TESTING
struct SingleHouseDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: .houseUpdatedWithLinks,
          showError: true
        ) {}
      }
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: .houseUpdatedWithoutLinks,
          showError: false
        ) {}
      }
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: nil,
          showError: false
        ) {}
      }
    }
  }
}
#endif
