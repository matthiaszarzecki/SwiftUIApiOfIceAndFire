//
//  SingleHouseCell.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 15.02.21.
//

import SwiftUI

struct SingleHouseCell: View {
  let house: HouseBasic
  
  var houseIcon: some View {
    let circleSize: CGFloat = 32
    if house.heraldryColors.hasEntries {
      // When colors exists, create a CircularColorDisplay
      return AnyView(
        CircularColorDisplay(colors: house.heraldryColors, size: circleSize)
      )
    } else {
      // When no colors exists, show first letter of house on colored circle.
      return AnyView(
        ZStack {
          Circle()
            .foregroundColor(.housesOfWesterosRed)
            .frame(width: circleSize, height: circleSize, alignment: .center)
          
          Text("\(house.initialLetter)")
            .foregroundColor(.white)
        }
      )
    }
  }

  var body: some View {
    NavigationLink(
      destination: SingleHouseView(houseBasic: house)
    ) {
      HStack {
        houseIcon
        Text("\(house.name)")
        
        // When the house contains subnavigatable
        // pages & info show it here with an icon.
        if house.containsLinks {
          Image(systemName: "link")
            .foregroundColor(.housesOfWesterosRed)
        }
      }
    }
  }
}

struct SingleHouseCell_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ForEach(MockClasses.housesBasic, id: \.self) { house in
        SingleHouseCell(house: house)
      }
    }
  }
}
