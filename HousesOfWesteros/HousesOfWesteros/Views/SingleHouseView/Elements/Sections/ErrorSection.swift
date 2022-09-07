//
//  ErrorSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct ErrorSection: View {
  let viewModel: ErrorDisplayViewModel

  var body: some View {
    Section(
      header: SectionHeader(text: viewModel.textTitle)
    ) {
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
struct ErrorSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      ErrorSection(viewModel: .mockErrorDisplayViewModel)
    }
  }
}
#endif
