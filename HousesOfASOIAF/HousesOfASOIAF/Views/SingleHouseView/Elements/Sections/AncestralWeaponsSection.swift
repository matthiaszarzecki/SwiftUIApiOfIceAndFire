//
//  AncestralWeapons.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct AncestralWeaponsSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if house.ancestralWeapons.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "Ancestral Weapons")) {
        ForEach(house.ancestralWeapons, id: \.self) { weapon in
          Text("🗡️ \(weapon)")
        }
      }
    }
  }
}

struct AncestralWeapons_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AncestralWeaponsSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
