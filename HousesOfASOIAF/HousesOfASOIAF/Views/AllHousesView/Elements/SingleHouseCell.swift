//
//  SingleHouseCell.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 15.02.21.
//

import SwiftUI

struct SingleHouseCell: View {
  let house: HouseBasic

  var body: some View {
    NavigationLink(
      destination: SingleHouseView(houseBasic: house)
    ) {
      HStack {
        if let colors = house.heraldryColors, colors.hasEntries {
          let circleSize: CGFloat = 32
          CircularColorDisplay(colors: colors)
            .frame(width: circleSize, height: circleSize, alignment: .center)
        }
        
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
      SingleHouseCell(house: MockClasses.houseBasicWithLinks)
      SingleHouseCell(house: MockClasses.houseBasicWithoutLinks)
    }
  }
}
