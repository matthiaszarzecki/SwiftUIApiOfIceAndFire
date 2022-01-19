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
    if let swornMembers = house.swornMembers,
      swornMembers.hasEntries {
      let sectionHeader = swornMembers.count > 1
        ? SectionHeader(text: "Sworn Members: \(swornMembers.count)")
        : SectionHeader(text: "Sworn Member")
      
      Section(header: sectionHeader) {
        ForEach(swornMembers, id: \.self) { character in
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

struct SwornMembers_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      SwornMembersSection(
        house: MockClasses.houseUpdatedWithLinks
      )
    }
  }
}
