//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembersSection: View {
  let swornMembers: [CharacterBasic]

  var body: some View {
    if swornMembers.hasEntries {
      let sectionHeader = swornMembers.count > 1
        ? SectionHeader(text: "Sworn Members: \(swornMembers.count)")
        : SectionHeader(text: "Sworn Member")

      Section(header: sectionHeader) {
        ForEach(swornMembers, id: \.self) { character in
          NavigationCharacterCell(character: character)
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
        swornMembers: .mockCharacters
      )
    }
  }
}
#endif
