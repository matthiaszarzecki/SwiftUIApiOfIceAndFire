//
//  HouseCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct HouseCellUpdated: View {
  var house: HouseUpdated
  
  var body: some View {
    HStack {
      HouseIcon(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        size: 24
      )
      Text("\(house.name)")
      
      if house.containsSubViews {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

struct HouseCellBasic: View {
  var house: HouseBasic
  var iconSize: CGFloat
  
  var body: some View {
    HStack {

      if house.isGreatHouse {
        Image("house_icon_\(house.id)")
          .resizable()
          .frame(width: iconSize, height: iconSize, alignment: .center)
          .shadow(color: .westerosRed, radius: 6)
      } else {
        HouseIcon(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          size: iconSize
        )
      }
      
      Text("\(house.name)")
      
      if house.containsLinks {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

struct HouseCell_Previews: PreviewProvider {
  static var previews: some View {
    HouseCellUpdated(
      house: MockClasses.houseUpdatedWithLinks
    )
    .padding()
    .previewLayout(.sizeThatFits)
    
    HouseCellBasic(
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      iconSize: 24
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
