//
//  BornSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct BornSection: View {
  var character: CharacterBasic

  var body: some View {
    if character.born.exists {
      Section(header: SectionHeader(text: "Born")) {
        Text("\(character.born)")
      }
    }
  }
}

#if !TESTING
struct BornSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      BornSection(character: .mockCharacter)
    }
  }
}
#endif
