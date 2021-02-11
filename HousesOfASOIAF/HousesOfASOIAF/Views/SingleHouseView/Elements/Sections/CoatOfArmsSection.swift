//
//  CoatOfArms.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CoatOfArmsSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if !house.coatOfArms.isEmpty {
      Section(header: SectionHeader(text: "Coat of Arms")) {
        Text("\(house.coatOfArms)")
      }
    }
  }
}

struct CoatOfArms_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CoatOfArmsSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
