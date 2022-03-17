//
//  CultureSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CultureSection: View {
  var character: CharacterBasic

  var body: some View {
    if character.culture.exists {
      Section(header: SectionHeader(text: "Culture")) {
        Text("\(character.culture)")
      }
    }
  }
}

#if !TESTING
struct CultureSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CultureSection(character: .character)
    }
  }
}
#endif
