//
//  TvShowAppearancesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct TvShowAppearancesSection: View {
  var character: CharacterBasic

  var body: some View {
    if character.tvShowAppearances.hasNonEmptyEntries {
      Section(header: SectionHeader(text: "TV Show Appearances")) {
        ForEach(character.tvShowAppearances, id: \.self) { appearance in
          Text("📺 \(appearance)")
        }
      }
    }
  }
}

struct TvShowAppearancesSection_Previews: PreviewProvider {
  static var previews: some View {
    TvShowAppearancesSection(character: MockClasses.character)
  }
}
