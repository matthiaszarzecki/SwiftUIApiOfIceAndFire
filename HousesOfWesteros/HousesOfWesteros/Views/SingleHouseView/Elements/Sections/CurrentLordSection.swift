//
//  CurrentLord.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CurrentLordSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let character = house.currentLord {
      Section(header: SectionHeader(text: "Current Lord")) {
        NavigationLink(destination: CharacterView(character: character)) {
          HStack {
            CharacterIcon(
              initialLetter: character.initialLetter,
              size: 24
            )
            Text("\(character.name)")
            
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

struct CurrentLord_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      CurrentLordSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
