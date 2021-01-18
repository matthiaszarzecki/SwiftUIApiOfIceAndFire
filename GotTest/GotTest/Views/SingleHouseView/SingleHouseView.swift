//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SingleHouseView: View {
  @State var house: House

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
    .onAppear {
      checkForDeeperData()
    }
  }
  
  func checkForDeeperData() {
    if house.founder.contains("http") {
      Api.getCharacter(url: house.founder) { character in
        self.house.founder = character.name
      }
    }
  }
}

struct SingleHouseView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseView(house: MockClasses.house)
  }
}
