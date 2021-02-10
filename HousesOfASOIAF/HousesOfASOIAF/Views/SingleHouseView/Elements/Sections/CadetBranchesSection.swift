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
    if let cadetBranches = house.cadetBranches {
      if cadetBranches.count > 0 {
        Section(header: SectionHeader(text: "Cadet Branches")) {
          ForEach(cadetBranches, id: \.self) { house in
            NavigationLink(destination: SingleHouseView(houseBasic: house)) {
              Text("🛡️ \(house.name)")
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
      CadetBranchesSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
