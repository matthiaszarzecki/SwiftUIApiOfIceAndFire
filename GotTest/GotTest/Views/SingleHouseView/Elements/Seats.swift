//
//  Seats.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct Seats: View {
  var house: HouseUpdated
  
  var body: some View {
    return VStack {
      if house.seats.count > 0 && house.seats[0] != "" {
        VStack {
          Text("Seats:")
            .font(.headline)
          ForEach(house.seats, id: \.self) { seat in
            Text("🏰 \(seat)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
}

struct Seats_Previews: PreviewProvider {
  static var previews: some View {
    Seats(house: MockClasses.houseUpdatedWithLinks)
      .previewLayout(.sizeThatFits)
  }
}
