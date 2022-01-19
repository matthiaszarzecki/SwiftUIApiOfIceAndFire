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
    if house.seats.hasNonEmptyEntries {
      let sectionHeader = house.seats.count > 1
        ? SectionHeader(text: "Seats: \(house.seats.count)")
        : SectionHeader(text: "Seat")

      Section(header: sectionHeader) {
        ForEach(house.seats, id: \.self) { seat in
          // Occasionally a seat with a lowercase
          // name ("unnamed castle") is returned.
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
