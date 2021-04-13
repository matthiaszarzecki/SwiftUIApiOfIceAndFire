//
//  SearchSpinnerView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI
import UIKit

/// The spinner that is shown in the Search-View at the last slot
struct SearchSpinnerView: View {
  var body: some View {
    SearchSpinner(style: .medium)
  }
  
  private struct SearchSpinner: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
      let spinner = UIActivityIndicatorView(style: style)
      spinner.hidesWhenStopped = true
      spinner.startAnimating()
      return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
  }
}

struct SearchSpinnerView_Previews: PreviewProvider {
  static var previews: some View {
    SearchSpinnerView()
      .previewLayout(.sizeThatFits)
  }
}
