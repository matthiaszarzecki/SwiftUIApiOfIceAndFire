//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SingleHouseView: View {
  var house: House

  var body: some View {
    return ScrollView {
      Group {
        Title(house: house)
        CoatOfArms(house: house)
        HouseMotto(house: house)
        Titles(house: house)
        Seats(house: house)
        CurrentLord(house: house)
      }
      Group {
        Overlord(house: house)
        Founded(house: house)
        Founder(house: house)
        DiedOut(house: house)
        AncestralWeapons(house: house)
        CadetBranches(house: house)
        SwornMembers(house: house)
      }
    }
    .padding()
  }
}

struct SingleHouseView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseView(house: MockClasses.house)
  }
}
