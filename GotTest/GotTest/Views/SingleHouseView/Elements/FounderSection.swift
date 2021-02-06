//
//  Founder.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FounderSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let character = house.founder {
      Section(header: SectionHeaderView(text: "Founded by", icon: "tray.and.arrow.up.fill")) {
        NavigationLink(destination: CharacterView(character: character)) {
          Text("👑 \(character.name)")
        }
      }
    }
  }
}

struct Founder_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FounderSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
