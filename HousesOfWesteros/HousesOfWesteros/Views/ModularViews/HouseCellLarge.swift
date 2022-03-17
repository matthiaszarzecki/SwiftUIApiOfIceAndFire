//
//  HouseCellLarge.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 25.04.21.
//

import SwiftUI

struct HouseCellLargeViewModel {
  var house: HouseBasic

  init(_ house: HouseBasic) {
    self.house = house
  }

  var backgroundColor: Color {
    if let unwrappedId = house.id {
      return .greatHousesMajorColor(id: unwrappedId)
    }
    return .white
  }

  var subtitle: String {
    var text = "Members: \(house.swornMembers.count)"

    if house.cadetBranches.hasEntries {
      text += " - Branches: \(house.cadetBranches.count)"
    }

    return text
  }
}

struct HouseCellLarge: View {
  var viewModel: HouseCellLargeViewModel
  var house: HouseBasic
  var width: CGFloat

  private var textElementWidth: CGFloat {
    width - 120
  }

  @ViewBuilder
  private var icon: some View {
    if let unwrappedId = house.id,
      house.isGreatHouse {
      HouseIconSigil(
        iconSize: .greatHouseCell,
        id: unwrappedId
      )
    } else {
      HouseIconColors(
        colors: house.heraldryColors,
        initialLetter: house.initialLetter,
        iconSize: .greatHouseCell
      )
    }
  }

  private var subtitleText: some View {
    Text(viewModel.subtitle)
      .shadow(color: .white, radius: 6)
      .frame(width: textElementWidth, height: 24, alignment: .leading)
      .multilineTextAlignment(.leading)
  }

  var body: some View {
    VStack {
      HStack {
        icon
          .padding()

        VStack {
          Text(house.name)
            .shadow(color: .white, radius: 6)
            .font(.title2)
            .frame(width: textElementWidth, height: 60, alignment: .topLeading)
            .multilineTextAlignment(.leading)

          subtitleText
        }
        .frame(width: textElementWidth, height: 80, alignment: .center)
      }
    }
    .frame(width: width, height: 100, alignment: .center)
    .backgroundColor(viewModel.backgroundColor)
    .mask(RoundedRectangle(cornerRadius: 22, style: .continuous))
    .shadow(radius: 10)
  }
}

#if !TESTING
struct HouseCellLarge_Previews: PreviewProvider {
  static var previews: some View {
    HouseCellLarge(
      viewModel: HouseCellLargeViewModel(
        .mockHouseBasicWithLinksAndWithCoatOfArms
      ),
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
      width: PreviewConstants.width
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
