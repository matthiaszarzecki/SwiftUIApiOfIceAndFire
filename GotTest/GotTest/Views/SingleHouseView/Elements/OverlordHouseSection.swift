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
    if let overlordHouse = house.overlord {
      Section(header: SectionHeader(text: "Overlord", icon: "tray.and.arrow.up.fill")) {
        NavigationLink(destination: SingleHouseView(houseBasic: overlordHouse)) {
          Text("🛡️ \(overlordHouse.name)")
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
