//
//  TvShowAppearancesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct TvShowAppearancesSection: View {
  let tvShowAppearances: [String]

  private let textTvShowAppearances = "TV Show Appearances"

  var body: some View {
    Section(
      header: SectionHeader(text: textTvShowAppearances)
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
        tvShowAppearances: .mockTvShowAppearances
      )
    }
  }
}
#endif
