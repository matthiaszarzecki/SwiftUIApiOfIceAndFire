//
//  HouseMotto.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseMotto: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if !house.words.isEmpty {
        Text("Words:")
          .font(.headline)
        Text("\(house.words)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct HouseMotto_Previews: PreviewProvider {
  static var previews: some View {
    HouseMotto(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
