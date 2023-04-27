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
    if
      let unwrappedId = house.id,
      house.isGreatHouse
    {
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
        .foregroundColor(.black)

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
        .foregroundColor(.black)

      if house.containsLinks {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
      }
    }
  }
}

struct HouseCellBasicForVStack: View {
  let house: HouseBasic
  let iconSize: IconSize
  let width: CGFloat

  var body: some View {
    HStack {
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        iconSize: iconSize
      )
      .padding(.spacing8)

      Text(house.name)
        .foregroundColor(.black)
        .frame(width: width * 0.7, height: 60, alignment: .leading)
        .multilineTextAlignment(.leading)

      Spacer()

      if house.containsLinks {
        Image(systemName: "link")
          .foregroundColor(.westerosRed)
          .padding(.spacing8)
      }
    }
    .frame(width: width, alignment: .center)
    .backgroundColor(.white)
    .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
    .shadow(radius: 10)
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
    .previewDisplayName("\(HouseCellUpdated.self)")

    HouseCellBasicForList(
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
      iconSize: .smallForNestedCells
    )
    .padding()
    .previewLayout(.sizeThatFits)
    .previewDisplayName("\(HouseCellBasicForList.self)")

    HouseCellBasicForVStack(
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
      iconSize: .smallForNestedCells,
      width: 350
    )
    .padding()
    .previewLayout(.sizeThatFits)
    .previewDisplayName("\(HouseCellBasicForVStack.self)")
  }
}
#endif
