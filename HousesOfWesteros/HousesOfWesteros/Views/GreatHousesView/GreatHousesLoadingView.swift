//
//  GreatHousesLoadingView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 30.04.21.
//

import SwiftUI

struct GreatHousesLoadingView: View {
  var width: CGFloat

  var textElementWidth: CGFloat {
    width - 120
  }

  var cell: some View {
    VStack {
      HStack {
        let circleSize = IconSize.greatHouseCell.rawValue
        Circle()
          .frame(width: circleSize, height: circleSize, alignment: .center)
          .foregroundColor(.redactedGray)
          .padding()

        VStack {
          Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .font(.title2)
            .frame(width: textElementWidth, height: 60, alignment: .topLeading)
            .redacted(reason: .placeholder)

          Text("aaaaaaaaaaaaaaaaaaaaaaaaa")
            .font(.body)
            .frame(width: textElementWidth, height: 24, alignment: .leading)
            .redacted(reason: .placeholder)
        }
        .frame(width: textElementWidth, height: 80, alignment: .center)
      }
    }
    .frame(width: width, height: 100, alignment: .center)
    .backgroundColor(.white)
    .mask(RoundedRectangle(cornerRadius: 22, style: .continuous))
    .shadow(radius: 10)
  }

  var body: some View {
    List {
      ForEach(0..<9, id: \.self) { _ in
        cell
      }
    }
    .listRowBackground(Color.clear)
  }
}

#if !DEBUG
struct GreatHousesLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesLoadingView(
      width: PreviewConstants.width
    )
  }
}
#endif
