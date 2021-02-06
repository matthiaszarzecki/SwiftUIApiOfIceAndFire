//
//  Founded.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FoundedSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if !house.founded.isEmpty {
      Section(header: SectionHeader(text: "Founded")) {
        Text("\(house.founded)")
      }
    }
  }
}

struct Founded_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FoundedSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
