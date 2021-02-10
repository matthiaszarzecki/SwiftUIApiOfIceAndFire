//
//  SectionHeader.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 06.02.21.
//

import SwiftUI

struct SectionHeader: View {
  let text: LocalizedStringKey

  var body: some View {
    Text(text)
      .lineLimit(1)
      .textCase(nil)
      .foregroundColor(.white)
      .padding(.vertical, 8)
      .padding(.horizontal, 14)
      .background(Color.gray)
      .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
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
    }
  }
}