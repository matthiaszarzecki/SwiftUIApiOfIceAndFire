//
//  DiedOut.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct DiedOutSection: View {
  let house: HouseUpdated

  var body: some View {
    if house.diedOutPeriod.exists {
      Section(header: SectionHeader(text: "House Died out")) {
        Text("☠️ \(house.diedOutPeriod)")
      }
    }
  }
}

#if !TESTING
struct DiedOut_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      DiedOutSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
