//
//  Heir.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

struct CurrentHeirSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let character = house.heir {
      Section(header: SectionHeader(text: "Current Heir")) {
        NavigationLink(destination: CharacterView(character: character)) {
          HStack {
            CharacterIcon(
              initialLetter: character.initialLetter,
              size: 24
            )
            Text("\(character.displayName)")
            
            if character.hasActor {
              Image(systemName: "person")
                .foregroundColor(.westerosRed)
            }
          }
        }
      }
    }
  }
}

struct Heir_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentHeirSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
