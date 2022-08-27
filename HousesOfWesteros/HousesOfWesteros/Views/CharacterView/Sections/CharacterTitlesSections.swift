//
//  CharacterTitlesSections.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterTitlesSections: View {
  let character: CharacterBasic

  var body: some View {
    if character.titles.hasNonEmptyEntries {
      let sectionHeader = character.titles.count > 1
        ? SectionHeader(text: "Titles: \(character.titles.count)")
        : SectionHeader(text: "Title")

      Section(header: sectionHeader) {
        ForEach(character.titles, id: \.self) { title in
          Text("🎖️ \(title)")
        }
      }
    }
  }
}

#if !TESTING
struct CharacterTitlesSections_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CharacterTitlesSections(character: .mockCharacter)
    }
  }
}
#endif
