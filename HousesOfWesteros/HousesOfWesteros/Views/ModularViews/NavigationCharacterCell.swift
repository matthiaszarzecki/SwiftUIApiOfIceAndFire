//
//  NavigationCharacterCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 27.08.22.
//

import Foundation
import SwiftUI

struct NavigationCharacterCell: View {
  let character: CharacterBasic

  var body: some View {
    if character.hasInformation {
      NavigationLink(
        destination: CharacterView(character: character)
      ) {
        CharacterCell(character: character)
      }
    } else {
      CharacterCell(character: character)
    }
  }
}

struct NavigationCharacterCell_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      NavigationCharacterCell(character: .mockCharacter)
    }
    .previewLayout(.sizeThatFits)

    NavigationCharacterCell(character: .mockCharacterWithNoData)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
