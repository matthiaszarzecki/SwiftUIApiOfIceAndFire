//
//  AllHousesLoadingView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct AllHousesLoadingView: View {
  private let numberOfPlacerholders = 14

  var body: some View {
    List {
      ForEach(0..<numberOfPlacerholders, id: \.self) { _ in
        HStack {
          Circle()
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundColor(.redactedGray)
          Spacer()
          Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
            .minimumScaleFactor(0.5)
            .redacted(reason: .placeholder)
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(.redactedGray)
        }
        .frame(height: 36)
      }
    }
  }
}

#if !TESTING
struct AllHousesLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    AllHousesLoadingView()
  }
}
#endif
