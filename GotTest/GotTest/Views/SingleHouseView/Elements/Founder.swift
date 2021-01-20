//
//  Founder.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Founder: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if let character = house.founder {
        Text("Founded by:")
          .font(.headline)
        
        NavigationLink(destination: CharacterView(character: character)) {
          HStack {
            Text("👑 \(character.name)")
            Image(systemName: "chevron.right")
          }
          .modifier(ButtonStyle())
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Founder_Previews: PreviewProvider {
  static var previews: some View {
    Founder(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
