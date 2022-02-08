//
//  DiedOut.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct DiedOutSection: View {
  var house: HouseUpdated

  var body: some View {
    if house.diedOutPeriod.exists {
      Section(header: SectionHeader(text: "House Died out")) {
        Text("☠️ \(house.diedOutPeriod)")
      }
    }
  }
}

#if !DEBUG
struct DiedOut_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      DiedOutSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
#endif
