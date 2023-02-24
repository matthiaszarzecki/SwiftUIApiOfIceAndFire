//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct MembersSection: View {
  let headerMultiple: String
  let headerSingle: String
  let members: [CharacterBasic]

  var body: some View {
    if members.hasEntries {
      let sectionHeader = members.count > 1
        ? SectionHeader(text: "\(headerMultiple): \(members.count)")
        : SectionHeader(text: headerSingle)

      Section(header: sectionHeader) {
        ForEach(members.sorted(), id: \.self) { character in
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
      MembersSection(
        headerMultiple: "Major Members",
        headerSingle: "Member",
        members: .mockCharacters
      )
    }
  }
}
#endif
