//
//  ErrorDisplay.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct ErrorDisplay: View {
  let reloadData: () -> Void

  private let ohNoText = "Oh No!"
  private let errorText = "Something went wrong fetching the data. Click here to try again!"

  var body: some View {
    List {
      Text(ohNoText)
      Button(
        action: {
          reloadData()
        },
        label: {
          HStack {
            Image(systemName: "arrow.triangle.2.circlepath")
            Text(errorText)
          }
          .foregroundColor(.red)
        }
      )
    }
  }
}

#if !TESTING
struct ErrorDisplay_Previews: PreviewProvider {
  static var previews: some View {
    ErrorDisplay {}
  }
}
#endif
