//
//  HouseIconSigil.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct HouseIconSigil: View {
  var iconSize: IconSize
  var id: Int

  var body: some View {
    Image("house_icon_\(id)")
      .resizable()
      .frame(width: iconSize.rawValue, height: iconSize.rawValue, alignment: .center)
      .shadow(color: .westerosRed, radius: 6)
  }
}

#if !TESTING
struct HouseIconSigil_Previews: PreviewProvider {
  static var previews: some View {
    HouseIconSigil(
      iconSize: .largeForMajorCells,
      id: MockClasses.idGreatHouse
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
