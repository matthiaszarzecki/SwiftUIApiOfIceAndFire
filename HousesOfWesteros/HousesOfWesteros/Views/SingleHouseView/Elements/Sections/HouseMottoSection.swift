//
//  HouseMotto.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseMottoSection: View {
  let motto: String

  private let textWords = "Words"

  var body: some View {
    Section(header: SectionHeader(text: )) {
      Text("🪶 \(motto)")
    }
  }
}

#if !TESTING
struct HouseMotto_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HouseMottoSection(motto: .mockMotto)
    }
  }
}
#endif
