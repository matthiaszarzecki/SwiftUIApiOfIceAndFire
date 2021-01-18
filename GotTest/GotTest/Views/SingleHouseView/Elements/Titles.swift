//
//  Titles.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Titles: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if house.titles.count > 0 && house.titles[0] != "" {
        VStack {
          Text("Titles:")
            .font(.headline)
          ForEach(house.titles, id: \.self) { title in
            Text("\(title)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Titles_Previews: PreviewProvider {
  static var previews: some View {
    Titles(house: MockClasses.houseUpdated)
      .previewLayout(.sizeThatFits)
  }
}
