//
//  CharacterTitlesSections.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterTitlesSections: View {
  var character: CharacterBasic
  
  var body: some View {
    if character.titles.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "Titles")) {
        ForEach(character.titles, id: \.self) { title in
          Text("🎖️ \(title)")
        }
      }
    }
  }
}

struct CharacterTitlesSections_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CharacterTitlesSections(character: MockClasses.character)
    }
  }
}
