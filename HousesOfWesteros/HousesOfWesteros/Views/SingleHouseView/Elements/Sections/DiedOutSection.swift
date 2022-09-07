//
//  DiedOut.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct DiedOutSection: View {
  let diedOutPeriod: String

  private let textHouseDiedOut = "House Died out"

  var body: some View {
    Section(header: SectionHeader(text: textHouseDiedOut)) {
      Text("☠️ \(diedOutPeriod)")
    }
  }
}

#if !TESTING
struct DiedOut_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      DiedOutSection(diedOutPeriod: .mockDiedOutPeriod)
    }
  }
}
#endif
