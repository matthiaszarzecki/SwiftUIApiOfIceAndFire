//
//  HouseCell.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI

struct HouseCellUpdated: View {
  let house: HouseUpdated
  let iconSize: IconSize

  @ViewBuilder
  private var icon: some View {
    if let unwrappedId = house.id,
      house.isGreatHouse {
      HouseIconSigil(
        iconSize: iconSize,
        id: unwrappedId
      )
    } else {
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        iconSize: iconSize
      )
    }
  }

  var body: some View {
    HStack {
      icon

      Text(house.name)

      if house.containsSubViews {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

struct HouseCellBasicForList: View {
  let house: HouseBasic
  let iconSize: IconSize

  @ViewBuilder
  private var icon: some View {
    if let unwrappedId = house.id,
      house.isGreatHouse {
      HouseIconSigil(
        iconSize: iconSize,
        id: unwrappedId
      )
    } else {
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        iconSize: iconSize
      )
    }
  }

  var body: some View {
    HStack {
      icon

      Text(house.name)

      if house.containsLinks {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

#if !TESTING
struct HouseCell_Previews: PreviewProvider {
  static var previews: some View {
    HouseCellUpdated(
      house: .houseUpdatedWithLinks,
      iconSize: .smallForNestedCells
    )
    .padding()
    .previewLayout(.sizeThatFits)

    HouseCellBasicForList(
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
      iconSize: .smallForNestedCells
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
