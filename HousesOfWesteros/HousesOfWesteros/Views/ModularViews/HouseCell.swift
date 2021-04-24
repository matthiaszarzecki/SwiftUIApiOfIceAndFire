//
//  HouseCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct HouseCellUpdated: View {
  var house: HouseUpdated
  
  private let iconSize: CGFloat = 24
  
  var icon: some View {
    if house.isGreatHouse {
      return AnyView(
        HouseIconSigil(
          iconSize: iconSize,
          id: house.id
        )
      )
    } else {
      return AnyView(
        HouseIconColors(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          size: iconSize
        )
      )
    }
  }
  
  var body: some View {
    HStack {
      icon
      
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
  
  var icon: some View {
    if house.isGreatHouse {
      return AnyView(
        HouseIconSigil(
          iconSize: iconSize,
          id: house.id
        )
      )
    } else {
      return AnyView(
        HouseIconColors(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          size: iconSize
        )
      )
    }
  }
  
  var body: some View {
    HStack {
      icon
      
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
