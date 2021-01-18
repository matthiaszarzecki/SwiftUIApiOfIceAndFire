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
  
  /// Gets locally saved URL's and updates corresponding values
  func checkForDeeperData() {
    // Not really happy about this, as it is quite over-fetching.
    // If the ApiOfIceAndFire were a graphql-compatible that would
    // be much more straightforward!
    if house.founder.contains("http") {
      Api.getCharacter(url: house.founder) { character in
        self.house.founder = character.name
      }
    }
    
    if house.currentLord.contains("http") {
      Api.getCharacter(url: house.currentLord) { character in
        self.house.currentLord = character.name
      }
    }
    
    if house.heir.contains("http") {
      Api.getCharacter(url: house.heir) { character in
        self.house.heir = character.name
      }
    }
    
    for index in (0..<house.swornMembers.count) {
      if house.swornMembers[index].contains("http") {
        Api.getCharacter(url: house.swornMembers[index]) { character in
          self.house.swornMembers[index] = character.name
        }
      }
    }
    
    if house.overlord.contains("http") {
      Api.getSingleHouse(url: house.overlord) { house in
        self.house.overlord = house.name
      }
    }
    
    for index in (0..<house.cadetBranches.count) {
      if house.cadetBranches[index].contains("http") {
        Api.getCharacter(url: house.cadetBranches[index]) { house in
          self.house.cadetBranches[index] = house.name
        }
      }
    }
  }
}

struct SingleHouseView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseView(house: MockClasses.house)
  }
}
