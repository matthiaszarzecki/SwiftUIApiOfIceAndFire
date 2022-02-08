//
//  PortrayedBySection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct PortrayedBySection: View {
  var character: CharacterBasic

  var body: some View {
    if character.portrayedBy.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "Portayed by")) {
        ForEach(character.portrayedBy, id: \.self) { actor in
          HStack {
            CharacterIcon(
              initialLetter: actor.first,
              size: 24
            )
            Text("\(actor)")
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
      PortrayedBySection(character: MockClasses.character)
    }
  }
}
#endif
