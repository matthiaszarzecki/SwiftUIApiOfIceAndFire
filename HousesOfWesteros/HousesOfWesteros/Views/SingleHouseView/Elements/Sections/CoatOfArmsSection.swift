//
//  CoatOfArms.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CoatOfArmsSection: View {
  let coatOfArms: String

  private let textCoatOfArms = "Coat of Arms"

  var body: some View {
    Section(
      header: SectionHeader(text: textCoatOfArms)
    ) {
      Text(coatOfArms)
    }
  }
}

#if !TESTING
struct CoatOfArms_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CoatOfArmsSection(coatOfArms: .mockCoatOfArms)
    }
  }
}
#endif
