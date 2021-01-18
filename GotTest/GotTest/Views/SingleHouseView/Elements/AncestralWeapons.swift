//
//  AncestralWeapons.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct AncestralWeapons: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if house.ancestralWeapons.count > 0 && house.ancestralWeapons[0] != "" {
        VStack {
          Text("Ancestral Weapons:")
            .font(.headline)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
          
          ForEach(house.ancestralWeapons, id: \.self) { weapon in
            Text("🗡️ \(weapon)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct AncestralWeapons_Previews: PreviewProvider {
  static var previews: some View {
    AncestralWeapons(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
