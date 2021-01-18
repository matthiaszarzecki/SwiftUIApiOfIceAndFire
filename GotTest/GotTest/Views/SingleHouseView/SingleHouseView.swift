//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SingleHouseView: View {
  var house: House
  @State var houseUpdated: HouseUpdated?

  var loader: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        ScrollView {
          Group {
            Title(house: unwrappedHouseUpdated)
            CoatOfArms(house: unwrappedHouseUpdated)
            HouseMotto(house: unwrappedHouseUpdated)
            Titles(house: unwrappedHouseUpdated)
            Seats(house: unwrappedHouseUpdated)
            CurrentLord(house: unwrappedHouseUpdated)
          }
          Group {
            Overlord(house: unwrappedHouseUpdated)
            Founded(house: unwrappedHouseUpdated)
            Founder(house: unwrappedHouseUpdated)
            DiedOut(house: unwrappedHouseUpdated)
            AncestralWeapons(house: unwrappedHouseUpdated)
            CadetBranches(house: unwrappedHouseUpdated)
            SwornMembers(house: unwrappedHouseUpdated)
          }
        }
        .padding()
      )
    } else {
      return AnyView(Text("Loading"))
    }
  }
  
  var body: some View {
    loader
      .onAppear {
        updateHouseData()
      }
  }
  
  /// Gets locally saved URL's and updates corresponding values
  func updateHouseData() {
    houseUpdated = HouseUpdated(fromHouse: house)
    
    if house.cointainsUrls {
      // Not really happy about this, as it is quite over-fetching.
      // If the ApiOfIceAndFire were graphql-compatible that would
      // be much more straightforward!
      
      if house.founder.contains("http") {
        Api.getCharacter(url: house.founder) { character in
          self.houseUpdated?.founder = character
        }
      }
      
      if house.currentLord.contains("http") {
        Api.getCharacter(url: house.currentLord) { character in
          self.houseUpdated?.currentLord = character
        }
      }
      
      if house.heir.contains("http") {
        Api.getCharacter(url: house.heir) { character in
          self.houseUpdated?.heir = character
        }
      }
      
      for index in (0..<house.swornMembers.count) {
        if house.swornMembers[index].contains("http") {
          Api.getCharacter(url: house.swornMembers[index]) { character in
            self.houseUpdated?.swornMembers?[index] = character
          }
        }
      }
      
      if house.overlord.contains("http") {
        Api.getSingleHouse(url: house.overlord) { house in
          self.houseUpdated?.overlord = house
        }
      }
      
      for index in (0..<house.cadetBranches.count) {
        if house.cadetBranches[index].contains("http") {
          Api.getSingleHouse(url: house.cadetBranches[index]) { house in
            self.houseUpdated?.cadetBranches?[index] = house
          }
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
