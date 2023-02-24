//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows information about the specified House.
struct SingleHouseView: View {
  @ObservedObject private var viewModel: SingleHouseViewModel

  var body: some View {
    GeometryReader { geometry in
      if let unwrappedHouseUpdated = viewModel.state.houseUpdated {
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
                  headerMultiple: viewModel.headerMajorMembersPlural,
                  headerSingle: viewModel.headerMajorMembersSingle,
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    $0.hasActor
                  }
                )

                MembersSection(
                  headerMultiple: viewModel.headerNoteworthyMembersPlural,
                  headerSingle: viewModel.headerNoteworthyMembersSingle,
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    !$0.hasActor && $0.hasInformation
                  }
                )

                MembersSection(
                  headerMultiple: viewModel.headerOtherMembersPlural,
                  headerSingle: viewModel.headerOtherMembersSingle,
                  members: unwrappedHouseUpdated.swornMembers.filter {
                    !$0.hasActor && !$0.hasInformation
                  }
                )
              }

              if viewModel.state.showError {
                ErrorSection(
                  viewModel: ErrorDisplayViewModel { viewModel.getDataFromNestedLinks() }
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

  init(viewModel: SingleHouseViewModel) {
    self.viewModel = viewModel
  }
}

#if !TESTING
struct SingleHouseDisplay_Previews: PreviewProvider {
  static var previews: some View {
    let configurations: [(house: HouseBasic, previewName: String)] = [
      (.mockHouseBasicWithLinksAndWithCoatOfArms, "WithLinksAndWithCoatOfArms"),
      (.mockHouseWithoutLinksWithoutCoatOfArms, "WithoutLinksWithoutCoatOfArms")
    ]

    ForEach(0..<configurations.count, id: \.self) { index in
      let configuration = configurations[index]
      NavigationView {
        SingleHouseView(
          viewModel: SingleHouseViewModel(houseBasic: configuration.house)
        )
      }
      .previewDisplayName(configuration.previewName)
    }
  }
}
#endif
