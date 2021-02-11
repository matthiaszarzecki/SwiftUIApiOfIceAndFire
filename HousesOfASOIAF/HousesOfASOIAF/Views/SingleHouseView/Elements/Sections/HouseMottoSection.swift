//
//  HouseMotto.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseMottoSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if !house.motto.isEmpty {
      Section(header: SectionHeader(text: "Words")) {
        Text("🪶 \(house.motto)")
      }
    }
  }
}

struct HouseMotto_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HouseMottoSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
