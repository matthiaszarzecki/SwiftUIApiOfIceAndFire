//
//  CharacterCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct CharacterCell: View {
  let character: CharacterBasic

  var body: some View {
    HStack {
      CharacterIcon(
        initialLetter: character.initialLetter,
        size: 24
      )
      Text(character.displayName)

      if character.hasActor {
        Image(systemName: "person")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

#if !TESTING
struct CharacterCell_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCell(character: .mockCharacter)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
#endif
