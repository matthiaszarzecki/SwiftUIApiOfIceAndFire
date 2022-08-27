//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranchesSection: View {
  let cadetBranches: [HouseBasic]

  var body: some View {
    let sectionHeader = cadetBranches.count > 1
    ? SectionHeader(text: "Cadet Branches: \(cadetBranches.count)")
    : SectionHeader(text: "Cadet Branch")

    Section(header: sectionHeader) {
      ForEach(cadetBranches, id: \.self) { cadetBranch in
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

#if !TESTING
struct CadetBranches_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CadetBranchesSection(
        cadetBranches: .mockHousesBasic
      )
    }
  }
}
#endif
