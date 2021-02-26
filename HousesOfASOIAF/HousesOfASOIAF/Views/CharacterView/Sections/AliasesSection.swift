//
//  AliasesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct AliasesSection: View {
  var character: Character
  
  var body: some View {
    if character.aliases.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "Aliases")) {
        ForEach(character.aliases, id: \.self) { alias in
          Text("\(alias)")
        }
      }
    }
  }
}

struct AliasesSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AliasesSection(character: MockClasses.character)
    }
  }
}
