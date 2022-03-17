//
//  HouseIcon.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 17.02.21.
//

import SwiftUI

struct HouseIconColors: View {
  var colors: [Color]
  var initialLetter: String
  var iconSize: IconSize

  @ViewBuilder
  var body: some View {
    if colors.hasEntries {
      // When colors exists, create a CircularColorDisplay.
      ZStack {
        let backgroundSize = iconSize.rawValue - 2
        Circle()
          .frame(
            width: backgroundSize,
            height: backgroundSize,
            alignment: .center
          )
          .shadow(color: .westerosRed, radius: 6)

        CircularColorDisplay(colors: colors, size: iconSize.rawValue)
      }
    } else {
      // When no colors exists, show first
      // letter of house on colored circle.
      ZStack {
        Circle()
          .foregroundColor(.westerosRed)
          .shadow(color: .westerosRed, radius: 6)
          .frame(
            width: iconSize.rawValue,
            height: iconSize.rawValue,
            alignment: .center
          )

        Text("\(initialLetter)")
          .foregroundColor(.white)
      }
    }
  }
}

#if !TESTING
struct HouseIcon_Previews: PreviewProvider {
  static var previews: some View {
    let houses: [HouseBasic] = [
      .mockHouseBasicWithLinksAndWithCoatOfArms,
      .mockHouseWithLinksAndWithoutCoatOfArms
    ]

    ForEach(houses, id: \.self) { house in
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        iconSize: .largeForMajorCells
      )
      .padding()
      .previewLayout(.sizeThatFits)
    }
  }
}
#endif
