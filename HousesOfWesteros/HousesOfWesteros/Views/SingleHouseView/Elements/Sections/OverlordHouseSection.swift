//
//  Overlord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct OverlordHouseSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let overlordHouse = house.overlordHouse {
      Section(
        header: SectionHeader(text: "Overlord")
      ) {
        NavigationLink(destination: SingleHouseView(houseBasic: overlordHouse)
        ) {
          HouseCellBasic(
            house: overlordHouse,
            iconSize: .smallForNestedCells
          )
        }
      }
    }
  }
}

struct Overlord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      OverlordHouseSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
