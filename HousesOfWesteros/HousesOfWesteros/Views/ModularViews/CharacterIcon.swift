//
//  CharacterIcon.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 17.02.21.
//

import SwiftUI

struct CharacterIcon: View {
  var initialLetter: String
  var size: CGFloat

  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.westerosRed)
        .shadow(color: .westerosRed, radius: 6)
        .frame(width: size, height: size, alignment: .center)

      Text("\(initialLetter)")
        .foregroundColor(.white)
    }
  }
}

#if !TESTING
struct CharacterIcon_Previews: PreviewProvider {
  static var previews: some View {
    CharacterIcon(
      initialLetter: MockClasses.character.initialLetter,
      size: 32
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
#endif
