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
      .redacted(reason: .placeholder)
  }
}

struct SectionHeaderStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .lineLimit(1)
      .textCase(nil)
      .foregroundColor(.white)
      .padding(.vertical, 8)
      .padding(.horizontal, 14)
      .backgroundColor(.gray)
      .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
      .padding(.leading, -9)
      .padding(.bottom, -10)
  }
}

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      Section(header: SectionHeader(text: "Title")) {
        Text("\(MockClasses.houseName)")
      }
      
      Section(header: LoadingSectionHeader()) {
        Text("\(MockClasses.houseName)")
          .redacted(reason: .placeholder)
      }
    }
  }
}
