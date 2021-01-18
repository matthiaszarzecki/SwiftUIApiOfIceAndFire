//
//  Overlord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Overlord: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if let overlordHouse = house.overlord {
        Text("Overlord:")
          .font(.headline)
        Text("\(overlordHouse.name)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Overlord_Previews: PreviewProvider {
  static var previews: some View {
    Overlord(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
