//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLordSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let character = house.currentLord {
      Section(header: SectionHeader(text: "Current Lord")) {
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

struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentLordSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
