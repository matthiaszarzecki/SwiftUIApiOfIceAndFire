//
//  CharacterView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

struct CharacterView: View {
  var character: Character
  
  var body: some View {
    VStack {
      Text("\(character.name)")
    }
  }
}

struct CharacterView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterView(character: MockClasses.character)
  }
}
