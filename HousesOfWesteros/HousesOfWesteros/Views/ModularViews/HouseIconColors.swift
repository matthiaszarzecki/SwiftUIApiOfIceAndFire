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
  var size: CGFloat
  
  var body: some View {
    if colors.hasEntries {
      // When colors exists, create
      // a CircularColorDisplay.
      return AnyView(
        ZStack {
          let backgroundSize = size - 2
          Circle()
            .frame(width: backgroundSize, height: backgroundSize, alignment: .center)
            .shadow(color: .westerosRed, radius: 6)
          
          CircularColorDisplay(colors: colors, size: size)
        }
      )
    } else {
      // When no colors exists, show first
      // letter of house on colored circle.
      return AnyView(
        ZStack {
          Circle()
            .foregroundColor(.westerosRed)
            .shadow(color: .westerosRed, radius: 6)
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
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        size: 32
      )
      .padding()
      .previewLayout(.sizeThatFits)
    }
  }
}
