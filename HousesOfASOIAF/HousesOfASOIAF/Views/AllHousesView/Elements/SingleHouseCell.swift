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
        HouseIcon(
          colors: house.heraldryColors,
          initialLetter: house.initialLetter,
          size: 32
        )
        Text("\(house.name)")
        
        // When the house contains subnavigatable
        // pages & info show it here with an icon.
        if house.containsLinks {
          Image(systemName: "link")
            .foregroundColor(.westerosRed)
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
