//
//  LinkSettingsRow.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 19.01.22.
//

import SwiftUI

struct LinkSettingsRow: View {
  let systemIcon: String
  let text: String
  let urlString: String

  @ViewBuilder var body: some View {
    if let url = URL(string: urlString) {
      Link(
        destination: url
      ) {
        SettingsRow(
          systemIcon: systemIcon,
          text: text
        )
      }
    } else {
      EmptyView()
    }
  }
}

#if !TESTING
struct LinkSettingsRow_Previews: PreviewProvider {
  static var previews: some View {
    LinkSettingsRow(
      systemIcon: "square.and.arrow.up",
      text: "Share",
      urlString: "https://twitter.com/matthias_code"
    )
    .padding()
    .previewLayout(.sizeThatFits)

    LinkSettingsRow(
      systemIcon: "square.and.arrow.up",
      text: "Share",
      urlString: ""
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
