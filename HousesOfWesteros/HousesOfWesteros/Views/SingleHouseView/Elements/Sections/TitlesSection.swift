//
//  Titles.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct TitlesSection: View {
  let titles: [String]

  private let textTitles = "Titles"
  private let textTitle = "Title"

  var body: some View {
    let sectionHeader = titles.count > 1
      ? SectionHeader(text: "Titles: \(titles.count)")
      : SectionHeader(text: "Title")

    Section(header: sectionHeader) {
      ForEach(titles, id: \.self) { title in
        // Occasionally a title with a lowercase
        // name (e.g. "the Knight of...") is returned.
        let displayTitle = title.capitalizeFirstLetter()

        Text("🎖️ \(displayTitle)")
      }
    }
  }
}

#if !TESTING
struct Titles_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      TitlesSection(titles: .mockTitles)
    }
  }
}
#endif
