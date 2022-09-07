//
//  BornSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct BornSection: View {
  let born: String

  private let textBorn = "Born"

  var body: some View {
    Section(
      header: SectionHeader(text: textBorn)
    ) {
      Text(born)
    }
  }
}

#if !TESTING
struct BornSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      BornSection(born: .mockBorn)
    }
  }
}
#endif
