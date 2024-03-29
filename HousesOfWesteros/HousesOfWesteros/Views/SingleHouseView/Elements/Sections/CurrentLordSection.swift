//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLordSection: View {
  let currentLord: CharacterBasic

  private let textCurrentLord = "Current Lord"

  var body: some View {
    Section(
      header: SectionHeader(text: textCurrentLord)
    ) {
      NavigationCharacterCell(character: currentLord)
    }
  }
}

#if !TESTING
struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentLordSection(currentLord: .mockCharacter)
    }
  }
}
#endif
