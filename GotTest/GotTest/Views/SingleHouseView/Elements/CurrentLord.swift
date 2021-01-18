//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLord: View {
  var house: House
  
  var body: some View {
    return VStack {
      if !house.currentLord.isEmpty {
        Text("Current Lord:")
          .font(.headline)
        Text("\(house.currentLord)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    CurrentLord(house: MockClasses.house)
      .previewLayout(.sizeThatFits)
  }
}
