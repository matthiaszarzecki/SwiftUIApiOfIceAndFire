//
//  Heir.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

struct CurrentHeirSection: View {
  let heir: CharacterBasic

  var body: some View {
    Section(
      header: SectionHeader(text: "Current Heir")
    ) {
      if heir.hasInformation {
        NavigationLink(
          destination: CharacterView(character: heir)
        ) {
          CharacterCell(character: heir)
        }
      } else {
        CharacterCell(character: heir)
      }
    }
  }
}

#if !TESTING
struct Heir_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentHeirSection(heir: .mockCharacter)
    }
  }
}
#endif
