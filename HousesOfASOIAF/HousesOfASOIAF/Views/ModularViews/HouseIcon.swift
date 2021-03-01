//
//  HouseIcon.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 17.02.21.
//

import SwiftUI

struct HouseIcon: View {
  var colors: [Color]
  var initialLetter: String
  var size: CGFloat
  
  var body: some View {
    if colors.hasEntries {
      // When colors exists, create a CircularColorDisplay
      return AnyView(
        CircularColorDisplay(colors: colors, size: size)
      )
    } else {
      // When no colors exists, show first letter of house on colored circle.
      return AnyView(
        ZStack {
          Circle()
            .foregroundColor(.westerosRed)
            .frame(width: size, height: size, alignment: .center)
          
          Text("\(initialLetter)")
            .foregroundColor(.white)
        }
      )
    }
  }
}

struct HouseIcon_Previews: PreviewProvider {
  static var previews: some View {
    let houses =  [
      MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      MockClasses.houseBasicWithLinksAndWithoutCoatOfArms,
    ]
    
    ForEach(houses, id: \.self) { house in
      HouseIcon(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        size: 32
      )
      .padding()
      .previewLayout(.sizeThatFits)
    }
  }
}
