//
//  CharacterDeathSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterDeathSection: View {
  let character: CharacterBasic

  var body: some View {
    if character.died.exists {
      Section(header: SectionHeader(text: "Died")) {
        Text("☠️ \(character.died)")
      }
    }
  }
}

#if !TESTING
struct CharacterDeathSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CharacterDeathSection(character: .mockCharacter)
    }
  }
}
#endif
