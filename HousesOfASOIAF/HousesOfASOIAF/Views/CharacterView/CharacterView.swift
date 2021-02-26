//
//  CharacterView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

/// Shows information about the specified character.
struct CharacterView: View {
  var character: Character
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        CharacterTitle(character: character)
          // Move everything upwards to counter the
          // auto-padding in a NavigationView.
          .frame(width: geometry.size.width - 16*2, height: 10, alignment: .center)
          .offset(y: -20)
        
        Form {
          BornSection(character: character)
          CultureSection(character: character)
          CharacterDeathSection(character: character)
          CharacterTitlesSections(character: character)
          AliasesSection(character: character)
          TvShowAppearancesSection(character: character)
          PortrayedBySection(character: character)
        }
      }
    }
  }
}

struct CharacterView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterView(character: MockClasses.character)
  }
}
