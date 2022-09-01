//
//  SettingsIcon.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 07.04.21.
//

import SwiftUI

struct SettingsIcon: View {
  let systemIcon: String

  var body: some View {
    Image(systemName: systemIcon)
      .font(.system(size: 14))
      .frame(width: 18, height: 18, alignment: .center)
      .foregroundColor(.white)
      .padding(6)
      .backgroundColor(.westerosRed)
      .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
  }
}

#if !TESTING
struct SettingsIcon_Previews: PreviewProvider {
  static var previews: some View {
    SettingsIcon(systemIcon: "square.and.arrow.up")
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
#endif
