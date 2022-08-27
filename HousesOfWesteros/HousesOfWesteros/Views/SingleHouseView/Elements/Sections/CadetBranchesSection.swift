//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranchesSection: View {
  let house: HouseUpdated

  var body: some View {
    if house.cadetBranches.hasEntries {
      let sectionHeader = house.cadetBranches.count > 1
        ? SectionHeader(text: "Cadet Branches: \(house.cadetBranches.count)")
        : SectionHeader(text: "Cadet Branch")

      Section(header: sectionHeader) {
        ForEach(house.cadetBranches, id: \.self) { cadetBranch in
          NavigationLink(
            destination: SingleHouseView(
              houseBasic: cadetBranch
            )
          ) {
            HouseCellBasic(
              house: cadetBranch,
              iconSize: .smallForNestedCells
            )
          }
        }
      }
    }
  }
}

#if !TESTING
struct CadetBranches_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CadetBranchesSection(
        house: .houseUpdatedWithLinks
      )
    }
  }
}
#endif
