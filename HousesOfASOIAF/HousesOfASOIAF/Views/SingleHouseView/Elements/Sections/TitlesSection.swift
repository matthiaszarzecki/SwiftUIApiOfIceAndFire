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
    if house.titles.count > 0 && house.titles[0] != "" {
      Section(header: SectionHeader(text: "Titles")) {
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

struct Titles_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      TitlesSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
