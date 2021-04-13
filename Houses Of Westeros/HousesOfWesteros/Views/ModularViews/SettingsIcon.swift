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
      .foregroundColor(.white)
      .padding(6)
      .backgroundColor(.westerosRed)
      .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
  }
}

struct SettingsIcon_Previews: PreviewProvider {
  static var previews: some View {
    SettingsIcon(systemIcon: "square.and.arrow.up")
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
