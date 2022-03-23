//
//  SearchSpinnerView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI
import UIKit

/// The spinner that is shown in the Search-View at the last slot
struct TinyLoadingIndicator: View {
  private let size: CGFloat = 24

  var body: some View {
    Image("dragon_no_background")
      .resizable()
      .frame(width: size, height: size, alignment: .center)
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
