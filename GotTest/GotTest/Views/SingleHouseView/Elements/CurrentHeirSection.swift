//
//  Heir.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

struct CurrentHeirSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let character = house.heir {
      Section(header: SectionHeaderView(text: "Current Heir", icon: "tray.and.arrow.up.fill")) {
        
        NavigationLink(destination: CharacterView(character: character)) {
          Text("👑 \(character.name)")
        }
      }
    }
  }
}

struct Heir_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentHeirSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
