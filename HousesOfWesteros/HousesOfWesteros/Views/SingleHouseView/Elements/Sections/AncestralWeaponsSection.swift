//
//  AncestralWeapons.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct AncestralWeaponsSection: View {
  let ancestralWeapons: [String]

  var body: some View {
    let sectionHeader = ancestralWeapons.count > 1
    ? SectionHeader(text: "Ancestral Weapons: \(ancestralWeapons.count)")
    : SectionHeader(text: "Ancestral Weapon")

    Section(header: sectionHeader) {
      ForEach(ancestralWeapons, id: \.self) { weapon in
        Text("🗡️ \(weapon)")
      }
    }
  }
}

#if !TESTING
struct AncestralWeapons_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AncestralWeaponsSection(
        ancestralWeapons: HouseUpdated.houseUpdatedWithLinks.ancestralWeapons
      )
    }
  }
}
#endif
