//
//  HouseCellLarge.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 25.04.21.
//

import SwiftUI

struct HouseCellLarge: View {
  private let viewModel: HouseCellLargeViewModel
  private let width: CGFloat

  private var textElementWidth: CGFloat {
    width * 0.75
  }

  @ViewBuilder
  private var icon: some View {
    if let unwrappedGreatHouseId = viewModel.greatHouseId {
      HouseIconSigil(
        iconSize: .greatHouseCell,
        id: unwrappedGreatHouseId
      )
    }
  }

  private var subtitleText: some View {
    Text(viewModel.subtitle)
      .foregroundColor(.black)
      .shadow(color: .white, radius: 6)
      .frame(width: textElementWidth, height: 24, alignment: .leading)
      .multilineTextAlignment(.leading)
      .minimumScaleFactor(0.5)
  }

  var body: some View {
    VStack {
      HStack {
        icon
          .padding()

        VStack(spacing: 0) {
          Text(viewModel.house.name)
            .foregroundColor(.black)
            .shadow(color: .white, radius: 6)
            .font(.title2)
            .frame(width: textElementWidth, height: 60, alignment: .leading)
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.5)

          subtitleText
        }
        .frame(width: textElementWidth, height: 80, alignment: .center)
      }
    }
    .frame(width: width, height: 100, alignment: .center)
    .backgroundColor(viewModel.backgroundColor)
    .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
    .shadow(radius: 10)
  }

  init(viewModel: HouseCellLargeViewModel, width: CGFloat) {
    self.viewModel = viewModel
    self.width = width
  }
}

#if !TESTING
struct HouseCellLarge_Previews: PreviewProvider {
  static var previews: some View {
    let houses: [HouseBasic] = [
      .mockHouseBasicWithLinksAndWithCoatOfArms,
      .mockHouseWithLinksAndWithoutCoatOfArms
    ]

    ForEach(houses, id: \.self) { house in
      HouseCellLarge(
        viewModel: HouseCellLargeViewModel(house),
        width: .previewWidth
      )
      .padding()
      .previewLayout(.sizeThatFits)
    }
  }
}
#endif
