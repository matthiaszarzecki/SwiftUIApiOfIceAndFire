//
//  BornSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct BornSection: View {
  let born: String

  var body: some View {
    Section(
      header: SectionHeader(text: "Born")
    ) {
      Text(born)
    }
  }
}

#if !TESTING
struct BornSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      BornSection(born: CharacterBasic.mockCharacter.born)
    }
  }
}
#endif
