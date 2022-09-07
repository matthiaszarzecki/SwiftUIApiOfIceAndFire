//
//  CharacterTitlesSections.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterTitlesSections: View {
  let titles: [String]

  private let textTitles = "Titles"
  private let textTitle = "Title"

  var body: some View {
    let sectionHeader = titles.count > 1
      ? SectionHeader(text: "\(textTitles): \(titles.count)")
      : SectionHeader(text: textTitle)

    Section(header: sectionHeader) {
      ForEach(titles, id: \.self) { title in
        Text("🎖️ \(title)")
      }
    }
  }
}

#if !TESTING
struct CharacterTitlesSections_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CharacterTitlesSections(titles: .mockTitles)
    }
  }
}
#endif
