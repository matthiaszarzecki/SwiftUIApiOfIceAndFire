//
//  Seats.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SeatsSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if house.seats.count > 0 && house.seats[0] != "" {
      Section(header: SectionHeader(text: "Seats")) {
        ForEach(house.seats, id: \.self) { seat in
          // Occasionally a seat with a lowercase name is returned.
          let displaySeat = seat.capitalizeFirstLetter()
          
          Text("🏰 \(displaySeat)")
        }
      }
    }
  }
}

struct Seats_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      SeatsSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
