//
//  SwornMembers.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SwornMembers: View {
  var house: House
  
  var body: some View {
    return VStack {
      if house.swornMembers.count > 0 {
        VStack {
          Text("Sworn Members:")
            .font(.headline)
          ForEach(house.swornMembers, id: \.self) { member in
            Text("\(member)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct SwornMembers_Previews: PreviewProvider {
  static var previews: some View {
    SwornMembers(house: MockClasses.house)
  }
}
