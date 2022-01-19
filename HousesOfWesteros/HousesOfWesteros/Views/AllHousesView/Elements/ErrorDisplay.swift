//
//  ErrorDisplay.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct ErrorDisplay: View {
  let reloadData: () -> Void
  
  var body: some View {
    List {
      Text("Oh No!")
      Button(
        action: {
          reloadData()
        },
        label: {
          HStack {
            Image(systemName: "arrow.triangle.2.circlepath")
            Text("Something went wrong fetching the data. Click here to try again!")
          }
          .foregroundColor(.red)
        }
      )
    }
  }
}

struct ErrorDisplay_Previews: PreviewProvider {
  static var previews: some View {
    ErrorDisplay {}
  }
}
