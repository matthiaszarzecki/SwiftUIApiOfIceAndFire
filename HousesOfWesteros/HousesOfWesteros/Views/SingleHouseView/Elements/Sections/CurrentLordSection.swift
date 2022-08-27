//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLordSection: View {
  let house: HouseUpdated

  var body: some View {
    if let character = house.currentLord {
      Section(
        header: SectionHeader(text: "Current Lord")
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
struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentLordSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
