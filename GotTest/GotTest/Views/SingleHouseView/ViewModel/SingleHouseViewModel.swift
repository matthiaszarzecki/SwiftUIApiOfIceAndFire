//
//  SingleHouseViewModel.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 20.01.21.
//

import SwiftUI

class SingleHouseViewModel: ObservableObject {
  var houseBasic: HouseBasic
  @Published private(set) var state = SingleHouseViewState()
  
  init(houseBasic: HouseBasic) {
    self.houseBasic = houseBasic
    getDataFromNestedLinks()
  }
  
  func getDataFromNestedLinks() {
    /// Turns the input House into a HouseUpdated
    /// by fetching data from locally saved URL's.
    state.houseUpdated = HouseUpdated(fromHouse: houseBasic)
    
    if houseBasic.cointainsLinks {
      // Not really happy about this, as it is quite over-fetching.
      // If the ApiOfIceAndFire were graphql-compatible that would
      // be much more straightforward!
      
      if houseBasic.founder.isUrl {
        Api.fetch(Character.self, url: houseBasic.founder) { character in
          self.state.houseUpdated?.founder = character
        }
      }
      
      if houseBasic.currentLord.isUrl {
        Api.fetch(Character.self, url: houseBasic.currentLord) { character in
          self.state.houseUpdated?.currentLord = character
        }
      }
      
      if houseBasic.heir.isUrl {
        Api.fetch(Character.self, url: houseBasic.heir) { character in
          self.state.houseUpdated?.heir = character
        }
      }
      
      for index in (0..<houseBasic.swornMembers.count) {
        if houseBasic.swornMembers[index].isUrl {
          Api.fetch(Character.self, url: houseBasic.swornMembers[index]) { character in
            self.state.houseUpdated?.swornMembers?[index] = character
          }
        }
      }
      
      if houseBasic.overlord.isUrl {
        Api.fetch(HouseBasic.self, url: houseBasic.overlord) { house in
          self.state.houseUpdated?.overlord = house
        }
      }
      
      for index in (0..<houseBasic.cadetBranches.count) {
        if houseBasic.cadetBranches[index].isUrl {
          Api.fetch(HouseBasic.self, url: houseBasic.cadetBranches[index]) { house in
            self.state.houseUpdated?.cadetBranches?[index] = house
          }
        }
      }
    }
  }
  
  struct SingleHouseViewState {
    var houseUpdated: HouseUpdated?
  }
}
