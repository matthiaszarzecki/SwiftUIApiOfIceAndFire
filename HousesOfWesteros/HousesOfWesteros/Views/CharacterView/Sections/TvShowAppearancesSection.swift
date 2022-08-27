//
//  TvShowAppearancesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct TvShowAppearancesSection: View {
  let tvShowAppearances: [String]

  var body: some View {
    Section(
      header: SectionHeader(text: "TV Show Appearances")
    ) {
      ForEach(tvShowAppearances, id: \.self) { appearance in
        Text("📺 \(appearance)")
      }
    }
  }
}

#if !TESTING
struct TvShowAppearancesSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      TvShowAppearancesSection(
        tvShowAppearances: CharacterBasic.mockCharacter.tvShowAppearances
      )
    }
  }
}
#endif
