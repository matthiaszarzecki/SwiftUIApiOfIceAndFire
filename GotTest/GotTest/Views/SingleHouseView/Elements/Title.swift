//
//  Title.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Title: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if !house.name.isEmpty {
        Text("\(house.name)")
          .font(.title)
      }
      
      if !house.region.isEmpty {
        Text("of \(house.region)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    Title(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
