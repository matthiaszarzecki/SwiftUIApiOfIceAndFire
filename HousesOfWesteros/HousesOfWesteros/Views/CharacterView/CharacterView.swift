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
        CharacterTitle(name: character.displayName)
          .frame(
            width: geometry.size.width - .spacing16 * 2,
            height: 10,
            alignment: .center
          )

          // Move everything upwards to counter the
          // auto-padding in a NavigationView.
          .offset(y: -20)

        Form {
          if character.born.exists {
            BornSection(born: character.born)
          }

          if character.culture.exists {
            CultureSection(culture: character.culture)
          }

          if character.died.exists {
            CharacterDeathSection(died: character.died)
          }

          if character.titles.hasNonEmptyEntries {
            CharacterTitlesSections(titles: character.titles)
          }

          if character.aliases.hasNonEmptyEntries {
            AliasesSection(aliases: character.aliases)
          }

          if character.tvShowAppearances.hasNonEmptyEntries {
            TvShowAppearancesSection(
              tvShowAppearances: character.tvShowAppearances
            )
          }

          if character.portrayedBy.hasNonEmptyEntries {
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
