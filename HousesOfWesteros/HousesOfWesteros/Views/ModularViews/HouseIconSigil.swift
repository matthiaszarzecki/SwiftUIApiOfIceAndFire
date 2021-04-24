//
//  HouseIconSigil.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct HouseIconSigil: View {
  var iconSize: CGFloat
  var id: Int
  
  var body: some View {
    Image("house_icon_\(id)")
      .resizable()
      .frame(width: iconSize, height: iconSize, alignment: .center)
      .shadow(color: .westerosRed, radius: 6)
  }
}

struct HouseIconSigil_Previews: PreviewProvider {
  static var previews: some View {
    HouseIconSigil(
      iconSize: 32,
      id: MockClasses.idGreatHouse
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
