//
//  HouseMotto.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseMottoSection: View {
  let house: HouseUpdated

  var body: some View {
    if house.motto.exists {
      Section(header: SectionHeader(text: "Words")) {
        Text("🪶 \(house.motto)")
      }
    }
  }
}

#if !TESTING
struct HouseMotto_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HouseMottoSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
