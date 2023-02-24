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

  var body: some View {
    SingleHouseDisplay(
      houseUpdated: singleHouseViewModel.state.houseUpdated,
      showError: singleHouseViewModel.state.showError,
      updateData: singleHouseViewModel.getDataFromNestedLinks
    )
  }

  init(viewModel: SingleHouseViewModel) {
    singleHouseViewModel = viewModel
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

              if unwrappedHouseUpdated.titles.hasNonEmptyEntries {
                TitlesSection(titles: unwrappedHouseUpdated.titles)
              }

              if unwrappedHouseUpdated.seats.hasNonEmptyEntries {
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

              if unwrappedHouseUpdated.ancestralWeapons.hasNonEmptyEntries {
                AncestralWeaponsSection(
                  ancestralWeapons: unwrappedHouseUpdated.ancestralWeapons
                )
              }

              if unwrappedHouseUpdated.cadetBranches.hasEntries {
                CadetBranchesSection(cadetBranches: unwrappedHouseUpdated.cadetBranches)
              }

              if unwrappedHouseUpdated.swornMembers.hasEntries {
                MembersSection(
                  headerMultiple: "Major Members",
                  headerSingle: "Major Member",
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    $0.hasActor
                  }
                )

                MembersSection(
                  headerMultiple: "Noteworthy Members",
                  headerSingle: "Noteworthy Member",
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    !$0.hasActor && $0.hasInformation
                  }
                )

                MembersSection(
                  headerMultiple: "Other Members",
                  headerSingle: "Other Member",
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    !$0.hasActor && !$0.hasInformation
                  }
                )
              }

              if showError {
                ErrorSection(
                  viewModel: ErrorDisplayViewModel { updateData() }
                )
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
