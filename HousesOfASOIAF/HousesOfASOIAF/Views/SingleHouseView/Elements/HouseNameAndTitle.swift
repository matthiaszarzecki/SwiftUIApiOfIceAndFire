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
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    HouseNameAndTitle(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
