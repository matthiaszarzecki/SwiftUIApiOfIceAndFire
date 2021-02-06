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
    if house.ancestralWeapons.count > 0 && house.ancestralWeapons[0] != "" {
      Section(header: SectionHeaderView(text: "Ancestral Weapons", icon: "tray.and.arrow.up.fill")) {
        ForEach(house.ancestralWeapons, id: \.self) { weapon in
          Text("🗡️ \(weapon)")
        }
      }
    }
  }
}

struct SectionHeaderView: View {
  let text: LocalizedStringKey
  var icon: String
  
  var body: some View {
    HStack(spacing: 6) {
      Image(systemName: icon)
        .imageScale(.medium)
        .font(.system(.subheadline, design: .rounded))
        .foregroundColor(.white)
      
      Text(text)
        .lineLimit(1)
        .textCase(nil)
    }
    .padding(.vertical, 8)
    .padding(.horizontal, 14)
    .background(Color.gray)
    .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
    .padding(.leading, -9)
    .padding(.bottom, -10)
  }
}

struct AncestralWeapons_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AncestralWeaponsSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
