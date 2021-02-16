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
    if let character = house.foundedByCharacter {
      Section(header: SectionHeader(text: "Founded by")) {
        NavigationLink(
          destination: NavigationLazyView(
            CharacterView(character: character)
          )
        ) {
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
