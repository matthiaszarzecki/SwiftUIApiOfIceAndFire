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

              if unwrappedHouseUpdated.heraldryColors.hasEntries {
                HeraldryColorsSection(
                  colors: unwrappedHouseUpdated.heraldryColors,
                  width: geometry.size.width
                )
              }

              HouseMottoSection(motto: unwrappedHouseUpdated.motto)
              TitlesSection(titles: unwrappedHouseUpdated.titles)
              SeatsSection(seats: unwrappedHouseUpdated.seats)

              if let currentLord = unwrappedHouseUpdated.currentLord {
                CurrentLordSection(currentLord: currentLord)
              }

              CurrentHeirSection(house: unwrappedHouseUpdated)
            }
            Group {
              if let overlordHouse = unwrappedHouseUpdated.overlordHouse {
                OverlordHouseSection(overlordHouse: overlordHouse)
              }

              if unwrappedHouseUpdated.foundingPeriod.exists {
                FoundedSection(foundingPeriod: unwrappedHouseUpdated.foundingPeriod)
              }

              if let founder = unwrappedHouseUpdated.foundedByCharacter {
                FounderSection(founder: founder)
              }

              if unwrappedHouseUpdated.diedOutPeriod.exists {
                DiedOutSection(diedOutPeriod: unwrappedHouseUpdated.diedOutPeriod)
              }

              AncestralWeaponsSection(house: unwrappedHouseUpdated)
              CadetBranchesSection(house: unwrappedHouseUpdated)

              SwornMembersSection(
                swornMembers: unwrappedHouseUpdated.swornMembers
              )

              if showError {
                ErrorSection { updateData() }
              }
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
