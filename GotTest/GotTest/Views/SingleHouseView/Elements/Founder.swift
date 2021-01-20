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
        Text("Founder:")
          .font(.headline)
        
        NavigationLink(destination: CharacterView(character: character)) {
          Text("👑 \(character.name)")
            .foregroundColor(.black)
            .padding()
            .background(Color.gray)
            .cornerRadius(12.0)
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
