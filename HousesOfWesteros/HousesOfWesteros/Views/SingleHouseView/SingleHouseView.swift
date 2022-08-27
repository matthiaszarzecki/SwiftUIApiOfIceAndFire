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
              if unwrappedHouseUpdated.coatOfArms.exists {
                CoatOfArmsSection(coatOfArms: unwrappedHouseUpdated.coatOfArms)
              }

              if unwrappedHouseUpdated.heraldryColors.hasEntries {
                HeraldryColorsSection(
                  colors: unwrappedHouseUpdated.heraldryColors,
                  width: geometry.size.width
                )
              }

              if unwrappedHouseUpdated.motto.exists {
                HouseMottoSection(motto: unwrappedHouseUpdated.motto)
              }

              if unwrappedHouseUpdated.titles.hasEntries {
                TitlesSection(titles: unwrappedHouseUpdated.titles)
              }

              if unwrappedHouseUpdated.seats.hasEntries {
                SeatsSection(seats: unwrappedHouseUpdated.seats)
              }

              if let currentLord = unwrappedHouseUpdated.currentLord {
                CurrentLordSection(currentLord: currentLord)
              }

              if let heir = unwrappedHouseUpdated.heir {
                CurrentHeirSection(heir: heir)
              }
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
            }

            Group {
              if unwrappedHouseUpdated.diedOutPeriod.exists {
                DiedOutSection(diedOutPeriod: unwrappedHouseUpdated.diedOutPeriod)
              }

              if unwrappedHouseUpdated.ancestralWeapons.hasEntries {
                AncestralWeaponsSection(
                  ancestralWeapons: unwrappedHouseUpdated.ancestralWeapons
                )
              }

              if unwrappedHouseUpdated.cadetBranches.hasEntries {
                CadetBranchesSection(cadetBranches: unwrappedHouseUpdated.cadetBranches)
              }

              if unwrappedHouseUpdated.swornMembers.hasEntries {
                SwornMembersSection(
                  swornMembers: unwrappedHouseUpdated.swornMembers
                )
              }

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
    let configurations: [(
      house: HouseUpdated?,
      showError: Bool
    )] = [
      (.houseUpdatedWithLinks, false),
      (.houseUpdatedWithoutLinks, true),
      (nil, true)
    ]

    ForEach(0..<configurations.count, id: \.self) { index in
      let configuration = configurations[index]
      NavigationView {
        SingleHouseDisplay(
          houseUpdated: configuration.house,
          showError: configuration.showError
        ) {}
      }
    }
  }
}
#endif
