//
//  CoatOfArms.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CoatOfArmsSection: View {
  let coatOfArms: String

  var body: some View {
    Section(
      header: SectionHeader(text: "Coat of Arms")
    ) {
      Text(coatOfArms)
    }
  }
}

#if !TESTING
struct CoatOfArms_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CoatOfArmsSection(coatOfArms: HouseUpdated.houseUpdatedWithLinks.coatOfArms)
    }
  }
}
#endif
