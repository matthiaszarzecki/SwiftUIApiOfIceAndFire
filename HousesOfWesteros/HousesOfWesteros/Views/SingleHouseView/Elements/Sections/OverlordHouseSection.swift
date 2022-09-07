//
//  Overlord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct OverlordHouseSection: View {
  let overlordHouse: HouseBasic

  private let textOverlord = "Overlord"

  var body: some View {
    Section(
      header: SectionHeader(text: textOverlord)
    ) {
      NavigationLink(
        destination: SingleHouseView(houseBasic: overlordHouse)
      ) {
        HouseCellBasic(
          house: overlordHouse,
          iconSize: .smallForNestedCells
        )
      }
    }
  }
}

#if !TESTING
struct Overlord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      OverlordHouseSection(
        overlordHouse: .mockHouseBasicWithLinksAndWithCoatOfArms
      )
    }
  }
}
#endif
