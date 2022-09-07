//
//  CultureSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CultureSection: View {
  let culture: String

  private let textCulture = "Culture"

  var body: some View {
    Section(
      header: SectionHeader(text: textCulture)
    ) {
      Text(culture)
    }
  }
}

#if !TESTING
struct CultureSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CultureSection(culture: .mockCulture)
    }
  }
}
#endif
