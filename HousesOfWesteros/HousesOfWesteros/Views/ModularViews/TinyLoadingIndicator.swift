//
//  SearchSpinnerView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// The spinner that is shown in the Search-View at the last slot
struct TinyLoadingIndicator: View {
  private let size: CGFloat = 24

  @State private var spin = false

  var body: some View {
    HStack {
      Spacer()

      Image("dragon_no_background")
        .resizable()
        .frame(width: size, height: size, alignment: .center)
        .rotationEffect(.degrees(spin ? 360 : 0))
        .animation(
          Animation.linear
            .repeatForever(autoreverses: false)
            .speed(0.2),
          value: spin
        )
        .onAppear {
          spin = true
        }
        .onDisappear {
          spin = false
        }

      Spacer()
    }
  }
}

#if !TESTING
struct TinyLoadingIndicator_Previews: PreviewProvider {
  static var previews: some View {
    TinyLoadingIndicator()
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
#endif
