//
//  DiedOut.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct DiedOutSection: View {
  let diedOutPeriod: String

  var body: some View {
    Section(header: SectionHeader(text: "House Died out")) {
      Text("☠️ \(diedOutPeriod)")
    }
  }
}

#if !TESTING
struct DiedOut_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      DiedOutSection(diedOutPeriod: HouseUpdated.houseUpdatedWithLinks.diedOutPeriod)
    }
  }
}
#endif
