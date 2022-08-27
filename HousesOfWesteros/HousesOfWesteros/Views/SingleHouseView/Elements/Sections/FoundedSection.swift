//
//  Founded.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FoundedSection: View {
  let foundingPeriod: String

  var body: some View {
    Section(
      header: SectionHeader(text: "Founded During")
    ) {
      Text("📜 \(foundingPeriod)")
    }
  }
}

#if !TESTING
struct Founded_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FoundedSection(foundingPeriod: HouseUpdated.houseUpdatedWithLinks.foundingPeriod)
    }
  }
}
#endif
