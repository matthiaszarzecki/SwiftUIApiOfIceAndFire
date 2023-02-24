//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranchesSection: View {
  let cadetBranches: [HouseBasic]

  private let textCadetBranches = "Cadet Branches"
  private let textCadetBranch = "Cadet Branch"

  var body: some View {
    let sectionHeader = cadetBranches.count > 1
    ? SectionHeader(text: "\(textCadetBranches): \(cadetBranches.count)")
    : SectionHeader(text: textCadetBranch)

    Section(header: sectionHeader) {
      ForEach(cadetBranches, id: \.self) { cadetBranch in
        NavigationLink(
          destination: SingleHouseView(
            viewModel: SingleHouseViewModel(houseBasic: cadetBranch)
          )
        ) {
          HouseCellBasicForList(
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
