//
//  HouseCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct HouseCellUpdated: View {
  var house: HouseUpdated
  var iconSize: IconSize
  
  var icon: some View {
    if let unwrappedId = house.id,
       house.isGreatHouse {
      return AnyView(
        HouseIconSigil(
          iconSize: iconSize,
          id: unwrappedId
        )
      )
    } else {
      return AnyView(
        HouseIconColors(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          iconSize: iconSize
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
  var iconSize: IconSize
  
  var icon: some View {
    if let unwrappedId = house.id,
       house.isGreatHouse {
      return AnyView(
        HouseIconSigil(
          iconSize: iconSize,
          id: unwrappedId
        )
      )
    } else {
      return AnyView(
        HouseIconColors(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          iconSize: iconSize
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
      house: MockClasses.houseUpdatedWithLinks,
      iconSize: .smallForNestedCells
    )
    .padding()
    .previewLayout(.sizeThatFits)
    
    HouseCellBasic(
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      iconSize: .smallForNestedCells
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
