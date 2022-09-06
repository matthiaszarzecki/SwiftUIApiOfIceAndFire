//
//  ErrorDisplay.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct ErrorDisplayViewModel {
  var reloadData: () -> Void

  let textTitle = "Oh No!"
  let textExplanation = "Something went wrong fetching the data. Click here to try again!"
}

struct ErrorDisplay: View {
  let viewModel: ErrorDisplayViewModel

  var body: some View {
    List {
      Text(viewModel.textTitle)
      Button(
        action: {
          viewModel.reloadData()
        },
        label: {
          HStack {
            Image(systemName: "arrow.triangle.2.circlepath")
            Text(viewModel.textExplanation)
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
    ErrorDisplay(viewModel: ErrorDisplayViewModel {})
  }
}
#endif
