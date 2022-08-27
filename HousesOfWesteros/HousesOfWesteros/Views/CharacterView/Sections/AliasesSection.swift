//
//  AliasesSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct AliasesSection: View {
  let aliases: [String]

  var body: some View {
    let sectionHeader = aliases.count > 1
    ? SectionHeader(text: "Aliases: \(aliases.count)")
    : SectionHeader(text: "Alias")

    Section(header: sectionHeader) {
      ForEach(aliases, id: \.self) { alias in
        Text(alias)
      }
    }
  }
}

#if !TESTING
struct AliasesSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      AliasesSection(aliases: .mockAliases)
    }
  }
}
#endif
