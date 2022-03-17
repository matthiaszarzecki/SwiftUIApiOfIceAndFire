//
//  Titles.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct TitlesSection: View {
  var house: HouseUpdated

  var body: some View {
    if house.titles.hasNonEmptyEntries {
      let sectionHeader = house.titles.count > 1
        ? SectionHeader(text: "Titles: \(house.titles.count)")
        : SectionHeader(text: "Title")

      Section(header: sectionHeader) {
        ForEach(house.titles, id: \.self) { title in
          // Occasionally a title with a lowercase
          // name ("the Knight of...") is returned.
          let displayTitle = title.capitalizeFirstLetter()

          Text("🎖️ \(displayTitle)")
        }
      }
    }
  }
}

#if !TESTING
struct Titles_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      TitlesSection(house: .houseUpdatedWithLinks)
    }
  }
}
#endif
