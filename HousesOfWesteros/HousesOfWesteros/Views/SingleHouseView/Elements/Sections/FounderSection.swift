//
//  Founder.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FounderSection: View {
  let founder: CharacterBasic

  var body: some View {
    Section(
      header: SectionHeader(text: "Founded by")
    ) {
      NavigationCharacterCell(character: founder)
    }
  }
}

#if !TESTING
struct Founder_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FounderSection(founder: .mockCharacter)
    }
  }
}
#endif
