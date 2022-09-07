//
//  Founded.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct FoundedSection: View {
  let foundingPeriod: String

  private let textFoundedDuring = "Founded During"

  var body: some View {
    Section(
      header: SectionHeader(text: textFoundedDuring)
    ) {
      Text("📜 \(foundingPeriod)")
    }
  }
}

#if !TESTING
struct Founded_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      FoundedSection(foundingPeriod: .mockFoundingPeriod)
    }
  }
}
#endif
