//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembers: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if let swornMembers = house.swornMembers {
        if swornMembers.count > 0 {
          VStack {
            Text("Sworn Members:")
              .font(.headline)
            ForEach(swornMembers, id: \.self) { character in
              NavigationLink(destination: CharacterView(character: character)) {
                Text("\(character.name)")
                  .foregroundColor(.black)
                  .padding()
                  .background(Color.gray)
                  .cornerRadius(12.0)
              }
            }
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        }
      }
    }
  }
}

struct SwornMembers_Previews: PreviewProvider {
  static var previews: some View {
    SwornMembers(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
