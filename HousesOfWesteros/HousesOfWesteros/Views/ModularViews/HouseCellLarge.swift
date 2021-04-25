//
//  HouseCellLarge.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 25.04.21.
//

import SwiftUI

struct HouseCellLarge: View {
  var house: HouseBasic
  var width: CGFloat
  
  var textElementWidth: CGFloat {
    return width - 100
  }
  
  var icon: some View {
    if house.isGreatHouse {
      return AnyView(
        HouseIconSigil(
          iconSize: .greatHouseCell,
          id: house.id
        )
      )
    } else {
      return AnyView(
        HouseIconColors(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          iconSize: .greatHouseCell
        )
      )
    }
  }
  
  var subtitleText: some View {
    var text = "Members: \(house.swornMembers.count)"
    
    if house.cadetBranches.hasEntries {
      text += " - Branches: \(house.cadetBranches.count)"
    }
    
    return Text(text)
      .shadow(color: .white, radius: 6)
      .frame(width: textElementWidth, height: 24, alignment: .leading)
      .multilineTextAlignment(.leading)
  }
  
  var body: some View {
    VStack {
      HStack {
        icon
          .padding()
        
        VStack {
          Text(house.name)
            .shadow(color: .white, radius: 6)
            .font(.title2)
            .frame(width: textElementWidth, height: 60, alignment: .topLeading)
            .multilineTextAlignment(.leading)
          
          subtitleText
        }
        .frame(width: textElementWidth, height: 80, alignment: .center)
      }
    }
    .frame(width: width, height: 100, alignment: .center)
    .backgroundColor(Constants.greatHousesMajorColor(id: house.id))
    .mask(RoundedRectangle(cornerRadius: 22, style: .continuous))
    .shadow(radius: 10)
  }
}

struct HouseCellLarge_Previews: PreviewProvider {
  static var previews: some View {
    HouseCellLarge(
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      width: PreviewConstants.width
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
