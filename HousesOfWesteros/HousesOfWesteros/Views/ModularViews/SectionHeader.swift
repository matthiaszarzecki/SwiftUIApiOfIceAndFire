//
//  SectionHeader.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 06.02.21.
//

import SwiftUI

struct SectionHeader: View {
  let text: String

  var body: some View {
    Text(text)
      .modifier(SectionHeaderStyle())
  }
}

struct LoadingSectionHeader: View {
  var body: some View {
    Text("AAAAAAAAAAAA")
      .modifier(SectionHeaderStyle())
      .minimumScaleFactor(0.5)
      .redacted(reason: .placeholder)
  }
}

struct SectionHeaderStyle: ViewModifier {
  func body(content: Content) -> some View {
    // The header alignment is fiddly, we need to do nonstandard
    // offsets and paddings here for it to look alright.

    content
      .lineLimit(1)
      .textCase(nil)
      .foregroundColor(.white)
      .padding(.vertical, 4)
      .padding(.horizontal, 16)
      .backgroundColor(.gray)
      .mask(
        RoundedRectangle(
          cornerRadius: 10,
          style: .continuous
        )
      )
      .offset(y: 10)
  }
}

#if !TESTING
struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    let houseName: String = .mockHouseName

    Form {
      Section(header: SectionHeader(text: "Title")) {
        Text(houseName)
      }

      Section(header: LoadingSectionHeader()) {
        Text(houseName)
          .redacted(reason: .placeholder)
      }
    }
  }
}
#endif
