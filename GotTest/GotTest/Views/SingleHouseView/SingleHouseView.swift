//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SingleHouseView: View {
  var houseBasic: HouseBasic?
  @State var houseUpdated: HouseUpdated?

  var loader: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        GeometryReader { geometry in
          ScrollView(showsIndicators: false) {
            Group {
              Title(house: unwrappedHouseUpdated)
              CoatOfArms(house: unwrappedHouseUpdated)
              HouseMotto(house: unwrappedHouseUpdated)
              Titles(house: unwrappedHouseUpdated)
              Seats(house: unwrappedHouseUpdated)
              CurrentLord(house: unwrappedHouseUpdated)
              Heir(house: unwrappedHouseUpdated)
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
          .frame(width: geometry.size.width, alignment: .center)
        }
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
  
  /// Turns the input House into a HouseUpdated
  /// by fetching data from locally saved URL's.
  func updateHouseData() {
    if houseUpdated == nil, let unwrappedHouse = houseBasic {
      houseUpdated = HouseUpdated(fromHouse: unwrappedHouse)
      
      if unwrappedHouse.cointainsLinks {
        // Not really happy about this, as it is quite over-fetching.
        // If the ApiOfIceAndFire were graphql-compatible that would
        // be much more straightforward!
        
        if unwrappedHouse.founder.isUrl {
          Api.fetch(Character.self, url: unwrappedHouse.founder) { character in
            self.houseUpdated?.founder = character
          }
        }
        
        if unwrappedHouse.currentLord.isUrl {
          Api.fetch(Character.self, url: unwrappedHouse.currentLord) { character in
            self.houseUpdated?.currentLord = character
          }
        }
        
        if unwrappedHouse.heir.isUrl {
          Api.fetch(Character.self, url: unwrappedHouse.heir) { character in
            self.houseUpdated?.heir = character
          }
        }
        
        for index in (0..<unwrappedHouse.swornMembers.count) {
          if unwrappedHouse.swornMembers[index].isUrl {
            Api.fetch(Character.self, url: unwrappedHouse.swornMembers[index]) { character in
              self.houseUpdated?.swornMembers?[index] = character
            }
          }
        }
        
        if unwrappedHouse.overlord.isUrl {
          Api.fetch(HouseBasic.self, url: unwrappedHouse.overlord) { house in
            self.houseUpdated?.overlord = house
          }
        }
        
        for index in (0..<unwrappedHouse.cadetBranches.count) {
          if unwrappedHouse.cadetBranches[index].isUrl {
            Api.fetch(HouseBasic.self, url: unwrappedHouse.cadetBranches[index]) { house in
              self.houseUpdated?.cadetBranches?[index] = house
            }
          }
        }
      }
    }
  }
}

struct SingleHouseView_Previews: PreviewProvider {
  static var previews: some View {
    SingleHouseView(houseUpdated: MockClasses.houseUpdated)
  }
}
