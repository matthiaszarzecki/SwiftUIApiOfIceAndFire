//
//  CharacterView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

/// Shows information about the specified character.
struct CharacterView: View {
  var character: CharacterBasic

  var body: some View {
    GeometryReader { geometry in
      VStack {
        CharacterTitle(character: character)
          .frame(
            width: geometry.size.width - .spacing16 * 2,
            height: 10,
            alignment: .center
          )

          // Move everything upwards to counter the
          // auto-padding in a NavigationView.
          .offset(y: -20)

        Form {
          BornSection(character: character)
          CultureSection(character: character)
          CharacterDeathSection(character: character)
          CharacterTitlesSections(character: character)

          if character.aliases.hasEntries {
            AliasesSection(aliases: character.aliases)
          }

          if character.tvShowAppearances.hasEntries {
            TvShowAppearancesSection(
              tvShowAppearances: character.tvShowAppearances
            )
          }

          if character.portrayedBy.hasEntries {
            PortrayedBySection(portrayedBy: character.portrayedBy)
          }
        }
      }
    }
  }
}

#if !TESTING
struct CharacterView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterView(character: .mockCharacter)
  }
}
#endif
