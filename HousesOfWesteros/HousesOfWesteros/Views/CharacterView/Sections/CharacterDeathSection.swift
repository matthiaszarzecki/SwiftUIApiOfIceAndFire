//
//  CharacterDeathSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterDeathSection: View {
  let died: String

  private let textDied = "Died"

  var body: some View {
    Section(
      header: SectionHeader(text: textDied)
    ) {
      Text("☠️ \(died)")
    }
  }
}

#if !TESTING
struct CharacterDeathSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CharacterDeathSection(died: .mockDied)
    }
  }
}
#endif
