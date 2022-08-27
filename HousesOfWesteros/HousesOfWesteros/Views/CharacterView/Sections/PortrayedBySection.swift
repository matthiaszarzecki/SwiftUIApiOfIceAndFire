//
//  PortrayedBySection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct PortrayedBySection: View {
  let character: CharacterBasic

  var body: some View {
    if character.portrayedBy.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "Portayed by")) {
        ForEach(character.portrayedBy, id: \.self) { characterActor in
          HStack {
            CharacterIcon(
              initialLetter: characterActor.first,
              size: 24
            )
            Text(characterActor)
          }
        }
      }
    }
  }
}

#if !TESTING
struct PortrayedBySection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      PortrayedBySection(character: .mockCharacter)
    }
  }
}
#endif
