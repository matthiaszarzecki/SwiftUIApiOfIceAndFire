//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembersSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let swornMembers = house.swornMembers, swornMembers.hasEntries {
      Section(header: SectionHeader(text: "Sworn Members")) {
        ForEach(swornMembers, id: \.self) { character in
          NavigationLink(destination: CharacterView(character: character)) {
            HStack {
              CharacterIcon(
                initialLetter: character.initialLetter,
                size: 24
              )
              Text("\(character.name)")
            }
          }
        }
      }
    }
  }
}

struct SwornMembers_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      SwornMembersSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
