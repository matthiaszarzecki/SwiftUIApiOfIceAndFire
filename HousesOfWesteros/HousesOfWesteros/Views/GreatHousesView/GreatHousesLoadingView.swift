//
//  GreatHousesLoadingView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 30.04.21.
//

import SwiftUI

struct GreatHousesLoadingView: View {
  var body: some View {
    GeometryReader { geometry in
      List {
        ForEach(0..<9, id: \.self) { _ in
          HouseCellLargeLoading(
            width: geometry.size.width - 16*2
          )
        }
      }
    }
  }
}

struct HouseCellLargeLoading: View {
  var width: CGFloat
  
  var textElementWidth: CGFloat {
    return width - 120
  }

  var subtitleText: some View {
    Text("Members: 2 - Branches: 2")
      .shadow(color: .white, radius: 6)
      .frame(width: textElementWidth, height: 24, alignment: .leading)
      .multilineTextAlignment(.leading)
  }
  
  var body: some View {
    VStack {
      HStack {
        Circle()
          .frame(width: IconSize.greatHouseCell.rawValue, height: IconSize.greatHouseCell.rawValue, alignment: .center)
          .foregroundColor(.redactedGray)
          .padding()
        
        VStack {
          Text(MockClasses.houseName)
            .shadow(color: .white, radius: 6)
            .font(.title2)
            .frame(width: textElementWidth, height: 60, alignment: .topLeading)
            .multilineTextAlignment(.leading)
            .redacted(reason: .placeholder)
          
          subtitleText
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
}

struct GreatHousesLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesLoadingView()
  }
}
