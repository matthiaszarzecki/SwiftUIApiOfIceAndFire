//
//  SettingsRow.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 08.04.21.
//

import SwiftUI

struct SettingsRow: View {
  let systemIcon: String
  let text: String

  var body: some View {
    HStack {
      SettingsIcon(systemIcon: systemIcon)
      Text(text)
        .foregroundColor(.black)
    }
  }
}

#if !TESTING
struct SettingsRow_Previews: PreviewProvider {
  static var previews: some View {
    SettingsRow(
      systemIcon: "square.and.arrow.up",
      text: "Share"
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
