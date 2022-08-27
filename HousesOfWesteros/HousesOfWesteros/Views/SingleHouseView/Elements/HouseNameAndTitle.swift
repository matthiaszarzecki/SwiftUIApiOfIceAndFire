//
//  Title.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseNameAndTitle: View {
  let house: HouseUpdated
  let width: CGFloat

  private var displayRegion: String {
    // Very rarely a house has no region. We
    // add a default here to ensure the view
    // still works.
    house.region.exists
      ? house.region
      : "Westeros"
  }

  var body: some View {
    VStack {
      let isGreatHouse = house.isGreatHouse
      let adaptedWidth = isGreatHouse
        ? width - .spacing36 * 2
        : width

      HStack {
        if
          let unwrappedId = house.id,
          isGreatHouse
        {
          HouseIconSigil(iconSize: .largeForHeader, id: unwrappedId)
        }

        if house.name.exists {
          Text(house.name)
            .font(.system(size: 200))
            .minimumScaleFactor(0.08)
            .multilineTextAlignment(.center)
            .frame(width: adaptedWidth, height: 40, alignment: .center)
        }
      }

      Text("of \(displayRegion)")
        .padding(.bottom, .spacing16)
    }
    .padding(.top, .spacing24)

    // In order for this to look good on the view above
    // on top of a Form this needs to be super-small and
    // offset to the top. This also breaks the local
    // preview but works within the encompassing view.
    .frame(width: width, height: 34, alignment: .center)

    // Move everything upwards to counter the
    // auto-padding in a NavigationView.
    .offset(y: -20)
  }
}

#if !TESTING
struct Title_Previews: PreviewProvider {
  static var previews: some View {
    HouseNameAndTitle(
      house: .houseUpdatedWithLinks,
      width: PreviewConstants.width
    )
    .offset(y: 50)
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
