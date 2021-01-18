//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLord: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if let character = house.currentLord {
        Text("Current Lord:")
          .font(.headline)
        Text("\(character.name)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    CurrentLord(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
