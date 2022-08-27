//
//  TvShowAppearancesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct TvShowAppearancesSection: View {
  let character: CharacterBasic

  var body: some View {
    if character.tvShowAppearances.hasNonEmptyEntries {
      Section(
        header: SectionHeader(text: "TV Show Appearances")
      ) {
        ForEach(character.tvShowAppearances, id: \.self) { appearance in
          Text("📺 \(appearance)")
        }
      }
    }
  }
}

#if !TESTING
struct TvShowAppearancesSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      TvShowAppearancesSection(
        character: .mockCharacter
      )
    }
  }
}
#endif
