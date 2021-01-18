//
//  CoatOfArms.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CoatOfArms: View {
  var house: House
  
  var body: some View {
    return VStack {
      if !house.coatOfArms.isEmpty {
        Text("Coat of Arms:")
          .font(.headline)
        Text("\(house.coatOfArms)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct CoatOfArms_Previews: PreviewProvider {
  static var previews: some View {
    CoatOfArms(house: MockClasses.house)
      .previewLayout(.sizeThatFits)
  }
}
