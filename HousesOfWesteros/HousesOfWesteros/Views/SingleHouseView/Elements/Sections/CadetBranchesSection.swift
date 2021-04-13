//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranchesSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let cadetBranches = house.cadetBranches,
       cadetBranches.hasEntries {
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
            HStack {
              HouseIcon(
                colors: cadetBranch.heraldryColors,
                initialLetter: cadetBranch.initialLetter,
                size: 32
              )
              Text("\(cadetBranch.name)")
            }
          }
        }
      }
    }
  }
}

struct CadetBranches_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CadetBranchesSection(
        house: MockClasses.houseUpdatedWithLinks
      )
    }
  }
}