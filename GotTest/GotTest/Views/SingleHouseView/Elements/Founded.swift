//
//  Founded.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Founded: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if !house.founded.isEmpty {
        Text("Founded:")
          .font(.headline)
        
        Text("\(house.founded)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Founded_Previews: PreviewProvider {
  static var previews: some View {
    Founded(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
