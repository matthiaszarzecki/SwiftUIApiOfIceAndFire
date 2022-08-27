//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembersSection: View {
  let house: HouseUpdated

  var body: some View {
    if house.swornMembers.hasEntries {
      let sectionHeader = house.swornMembers.count > 1
        ? SectionHeader(text: "Sworn Members: \(house.swornMembers.count)")
        : SectionHeader(text: "Sworn Member")

      Section(header: sectionHeader) {
        ForEach(house.swornMembers, id: \.self) { character in
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
}

#if !TESTING
struct SwornMembers_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      SwornMembersSection(
        house: .houseUpdatedWithLinks
      )
    }
  }
}
#endif
