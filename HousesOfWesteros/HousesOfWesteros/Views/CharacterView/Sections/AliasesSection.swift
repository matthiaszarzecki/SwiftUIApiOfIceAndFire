//
//  AliasesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct AliasesSection: View {
  var character: CharacterBasic

  var body: some View {
    if character.aliases.hasNonEmptyEntries {
      let sectionHeader = character.aliases.count > 1
        ? SectionHeader(text: "Aliases: \(character.aliases.count)")
        : SectionHeader(text: "Alias")

      Section(header: sectionHeader) {
        ForEach(character.aliases, id: \.self) { alias in
          Text("\(alias)")
        }
      }
    }
  }
}

#if !TESTING
struct AliasesSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AliasesSection(character: .character)
    }
  }
}
#endif
