//
//  SingleHouseLoadingView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 06.02.21.
//

import SwiftUI

struct SingleHouseLoadingView: View {
  var body: some View {
    VStack {
      Text("AAAAAAAAAAAAAA")
        .minimumScaleFactor(0.5)
        .font(.largeTitle)
        .redacted(reason: .placeholder)

      Text("AAAAAAAAAAAAAA")
        .minimumScaleFactor(0.5)
        .redacted(reason: .placeholder)

      Form {
        ForEach(0..<4, id: \.self) { _ in
          Section(header: LoadingSectionHeader()) {
            Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
              .minimumScaleFactor(0.5)
              .redacted(reason: .placeholder)
          }
        }
      }
    }
  }
}

#if !TESTING
struct SingleHouseLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseLoadingView()
  }
}
#endif
