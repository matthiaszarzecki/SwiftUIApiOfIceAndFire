//
//  CoatOfArms.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CoatOfArmsSection: View {
  let house: HouseUpdated

  var body: some View {
    if house.coatOfArms.exists {
      Section(header: SectionHeader(text: "Coat of Arms")) {
        Text(house.coatOfArms)
      }
    }
  }
}

#if !TESTING
struct CoatOfArms_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CoatOfArmsSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
