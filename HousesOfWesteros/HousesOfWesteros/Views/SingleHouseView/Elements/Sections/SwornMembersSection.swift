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
          NavigationLink(
            destination: CharacterView(
              character: character
            )
          ) {
            HStack {
              CharacterIcon(
                initialLetter: character.initialLetter,
                size: 24
              )
              Text("\(character.name)")
              
              if character.hasActor {
                Image(systemName: "person")
              }
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
      SwornMembersSection(
        house: MockClasses.houseUpdatedWithLinks
      )
    }
  }
}
