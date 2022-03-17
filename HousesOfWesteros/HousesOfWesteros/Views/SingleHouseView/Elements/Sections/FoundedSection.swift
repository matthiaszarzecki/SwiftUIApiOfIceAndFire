//
//  Founded.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FoundedSection: View {
  var house: HouseUpdated

  var body: some View {
    if house.foundingPeriod.exists {
      Section(header: SectionHeader(text: "Founded During")) {
        Text("📜 \(house.foundingPeriod)")
      }
    }
  }
}

#if !TESTING
struct Founded_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FoundedSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
