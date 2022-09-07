//
//  AncestralWeapons.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct AncestralWeaponsSection: View {
  let ancestralWeapons: [String]

  private let textAncestralWeapons = "Ancestral Weapons"
  private let textAncestralWeapon = "Ancestral Weapon"

  var body: some View {
    let sectionHeader = ancestralWeapons.count > 1
    ? SectionHeader(text: "\(textAncestralWeapons): \(ancestralWeapons.count)")
    : SectionHeader(text: textAncestralWeapon)

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
        ancestralWeapons: .mockAncestralWeapons
      )
    }
  }
}
#endif
