//
//  CharacterCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct CharacterCell: View {
  var character: CharacterBasic

  var body: some View {
    HStack {
      CharacterIcon(
        initialLetter: character.initialLetter,
        size: 24
      )
      Text("\(character.displayName)")

      if character.hasActor {
        Image(systemName: "person")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

struct CharacterCell_Previews: PreviewProvider {
  static var previews: some View {
    CharacterCell(character: MockClasses.character)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
