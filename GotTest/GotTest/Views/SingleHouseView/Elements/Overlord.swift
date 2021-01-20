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
        
        NavigationLink(destination: SingleHouseView(houseBasic: overlordHouse)) {
          Text("🏰 \(overlordHouse.name)")
            .foregroundColor(.black)
            .padding()
            .background(Color.gray)
            .cornerRadius(12.0)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Overlord_Previews: PreviewProvider {
  static var previews: some View {
    Overlord(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
