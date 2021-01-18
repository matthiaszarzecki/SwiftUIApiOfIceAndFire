//
//  CadetBranches.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct CadetBranches: View {
  var house: House
  
  var body: some View {
    return VStack {
      if house.cadetBranches.count > 0 {
        VStack {
          Text("Cadet Branches:")
            .font(.headline)
          ForEach(house.cadetBranches, id: \.self) { branch in
            Text("\(branch)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct CadetBranches_Previews: PreviewProvider {
  static var previews: some View {
    CadetBranches(house: MockClasses.house)
  }
}
