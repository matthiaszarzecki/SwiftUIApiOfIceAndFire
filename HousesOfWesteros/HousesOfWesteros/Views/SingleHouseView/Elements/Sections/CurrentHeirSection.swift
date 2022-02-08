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
      Section(
        header: SectionHeader(text: "Current Heir")
      ) {
        if character.hasInformation {
          NavigationLink(
            destination: CharacterView(character: character)
          ) {
            CharacterCell(character: character)
          }
        } else {
          CharacterCell(character: character)
        }
      }
    }
  }
}

#if !TESTING
struct Heir_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentHeirSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
#endif
