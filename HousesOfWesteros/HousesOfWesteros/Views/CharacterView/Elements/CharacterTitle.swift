//
//  CharacterTitle.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterTitle: View {
  var character: CharacterBasic
  
  var body: some View {
    Text("\(character.displayName)")
      .font(.title)
  }
}

struct CharacterTitle_Previews: PreviewProvider {
  static var previews: some View {
    CharacterTitle(character: MockClasses.character)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
