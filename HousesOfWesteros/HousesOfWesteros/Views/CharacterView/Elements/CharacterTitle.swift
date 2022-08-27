//
//  CharacterTitle.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 26.02.21.
//

import SwiftUI

struct CharacterTitle: View {
  var name: String

  var body: some View {
    Text(name)
      .font(.title)
  }
}

#if !TESTING
struct CharacterTitle_Previews: PreviewProvider {
  static var previews: some View {
    CharacterTitle(name: .mockCharacterName)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
#endif
