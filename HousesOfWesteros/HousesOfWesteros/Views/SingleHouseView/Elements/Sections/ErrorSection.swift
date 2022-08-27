//
//  ErrorSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 24.02.21.
//

import SwiftUI

struct ErrorSection: View {
  let showError: Bool
  let updateData: () -> Void

  var body: some View {
    if showError {
      Section(header: SectionHeader(text: "Oh No!")) {
        Button(
          action: {
            updateData()
          },
          label: {
            HStack {
              Image(systemName: "arrow.triangle.2.circlepath")
              Text("Something went wrong fetching additional data. Click here to try again!")
            }
            .foregroundColor(.red)
          }
        )
      }
    }
  }
}

#if !TESTING
struct ErrorSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      ErrorSection(
        showError: true
      ) {}
    }
  }
}
#endif
