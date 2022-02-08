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
        .font(.largeTitle)
        .redacted(reason: .placeholder)

      Text("AAAAAAAAAAAAAA")
        .redacted(reason: .placeholder)

      Form {
        ForEach(0..<4, id: \.self) { _ in
          Section(header: LoadingSectionHeader()) {
            Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
              .redacted(reason: .placeholder)
          }
        }
      }
    }
  }
}

#if !DEBUG
struct SingleHouseLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseLoadingView()
  }
}
#endif
