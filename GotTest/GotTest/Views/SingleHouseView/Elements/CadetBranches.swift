//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranches: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if let cadetBranches = house.cadetBranches {
        if cadetBranches.count > 0 {
          VStack {
            Text("Cadet Branches:")
              .font(.headline)
            
            ForEach(cadetBranches, id: \.self) { house in
              NavigationLink(destination: SingleHouseView(houseBasic: house)) {
                HStack {
                  Text("🛡️ \(house.name)")
                  Image(systemName: "chevron.right")
                }
                .modifier(ButtonStyle())
              }
            }
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        }
      }
    }
  }
}

struct CadetBranches_Previews: PreviewProvider {
  static var previews: some View {
    CadetBranches(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
