//
//  Title.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseNameAndTitle: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if house.name.exists {
        Text("\(house.name)")
          .font(.title)
      }
      
      if house.region.exists {
        Text("of \(house.region)")
          .padding(.bottom, 16)
      }
    }
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    HouseNameAndTitle(house: MockClasses.houseUpdatedWithLinks)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
