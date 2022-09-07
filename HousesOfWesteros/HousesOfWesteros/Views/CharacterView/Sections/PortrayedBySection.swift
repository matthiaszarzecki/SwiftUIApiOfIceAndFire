//
//  PortrayedBySection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct PortrayedBySection: View {
  let portrayedBy: [String]

  private let textPortrayedBy = "Portrayed by"

  var body: some View {
    Section(
      header: SectionHeader(text: textPortrayedBy)
    ) {
      ForEach(portrayedBy, id: \.self) { characterActor in
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

#if !TESTING
struct PortrayedBySection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      PortrayedBySection(portrayedBy: .mockPortrayedBy)
    }
  }
}
#endif
