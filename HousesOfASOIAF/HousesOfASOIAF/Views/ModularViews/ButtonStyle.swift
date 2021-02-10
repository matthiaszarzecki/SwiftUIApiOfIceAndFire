//
//  ButtonStyle.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 20.01.21.
//

import Foundation
import SwiftUI

struct ButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .padding()
      .background(Color.gray)
      .cornerRadius(12.0)
  }
}

struct ButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Text("This is a button")
      .modifier(ButtonStyle())
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
