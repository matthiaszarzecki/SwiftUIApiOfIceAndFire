//
//  Heir.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

struct CurrentHeirSection: View {
  let heir: CharacterBasic

  private let textCurrentHeir = "Current Heir"

  var body: some View {
    Section(
      header: SectionHeader(text: textCurrentHeir)
    ) {
      NavigationCharacterCell(character: heir)
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
