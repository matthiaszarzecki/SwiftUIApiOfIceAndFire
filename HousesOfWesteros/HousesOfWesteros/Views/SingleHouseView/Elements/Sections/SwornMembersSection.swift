//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembersSection: View {
  let swornMembers: [CharacterBasic]

  private let textSwornMembers = "Sworn Members"
  private let textSwornMember = "Sworn Member"

  var body: some View {
    if swornMembers.hasEntries {
      let sectionHeader = swornMembers.count > 1
        ? SectionHeader(text: "\(textSwornMembers): \(swornMembers.count)")
        : SectionHeader(text: textSwornMember)

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
