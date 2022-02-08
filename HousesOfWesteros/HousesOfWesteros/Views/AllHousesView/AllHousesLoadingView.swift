//
//  AllHousesLoadingView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct AllHousesLoadingView: View {
  var body: some View {
    List {
      ForEach(0..<14, id: \.self) { _ in
        HStack {
          Circle()
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundColor(.redactedGray)
          Spacer()
          Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
            .redacted(reason: .placeholder)
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(.redactedGray)
        }
      }
    }
  }
}

#if !DEBUG
struct AllHousesLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    AllHousesLoadingView()
  }
}
#endif
