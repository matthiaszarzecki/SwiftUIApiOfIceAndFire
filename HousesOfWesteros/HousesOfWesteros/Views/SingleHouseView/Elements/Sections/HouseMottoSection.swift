//
//  HouseMotto.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseMottoSection: View {
  let motto: String

  var body: some View {
    Section(header: SectionHeader(text: "Words")) {
      Text("🪶 \(motto)")
    }
  }
}

#if !TESTING
struct HouseMotto_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HouseMottoSection(motto: HouseUpdated.houseUpdatedWithLinks.motto)
    }
  }
}
#endif
