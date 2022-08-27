//
//  Seats.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SeatsSection: View {
  let seats: [String]

  var body: some View {
    if seats.hasNonEmptyEntries {
      let sectionHeader = seats.count > 1
        ? SectionHeader(text: "Seats: \(seats.count)")
        : SectionHeader(text: "Seat")

      Section(header: sectionHeader) {
        ForEach(seats, id: \.self) { seat in
          // Occasionally a seat with a lowercase
          // name (e.g. "unnamed castle") is returned.
          let displaySeat = seat.capitalizeFirstLetter()

          Text("🏰 \(displaySeat)")
        }
      }
    }
  }
}

#if !TESTING
struct Seats_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      SeatsSection(seats: HouseUpdated.houseUpdatedWithLinks.seats)
    }
  }
}
#endif
