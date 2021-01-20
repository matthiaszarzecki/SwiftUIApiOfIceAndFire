//
//  DiedOut.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct DiedOut: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if !house.diedOut.isEmpty {
        let text = Text("House died out during:").font(.headline) + Text(" \(house.diedOut)")
        
        text
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct DiedOut_Previews: PreviewProvider {
  static var previews: some View {
    DiedOut(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
