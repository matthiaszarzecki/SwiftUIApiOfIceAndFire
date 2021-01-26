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
      
      // TODO: Combine these functions into a single one OR use a combined publisher
      updateFounder()
      updateCurrentLord()
      updateHeir()
      updateOverlord()
      updateSwornMembers()
    }
  }
  
  func updateFounder() {
    if houseBasic.founder.isLink {
      Api.fetch(Character.self, url: houseBasic.founder) { character in
        self.state.houseUpdated?.founder = character
      }
    }
  }
  
  func updateCurrentLord() {
    if houseBasic.currentLord.isLink {
      Api.fetch(Character.self, url: houseBasic.currentLord) { character in
        self.state.houseUpdated?.currentLord = character
      }
    }
  }
  
  func updateHeir() {
    if houseBasic.heir.isLink {
      Api.fetch(Character.self, url: houseBasic.heir) { character in
        self.state.houseUpdated?.heir = character
      }
    }
  }
  
  func updateOverlord() {
    if houseBasic.overlord.isLink {
      Api.fetch(HouseBasic.self, url: houseBasic.overlord) { house in
        self.state.houseUpdated?.overlord = house
      }
    }
  }
  
  func updateCadetBranches() {
    for index in (0..<houseBasic.cadetBranches.count) {
      if houseBasic.cadetBranches[index].isLink {
        Api.fetch(HouseBasic.self, url: houseBasic.cadetBranches[index]) { house in
          self.state.houseUpdated?.cadetBranches?[index] = house
        }
      }
    }
  }
  
  func updateSwornMembers() {
    for index in (0..<houseBasic.swornMembers.count) {
      if houseBasic.swornMembers[index].isLink {
        Api.fetch(Character.self, url: houseBasic.swornMembers[index]) { character in
          self.state.houseUpdated?.swornMembers?[index] = character
        }
      }
    }
  }
  
  struct SingleHouseViewState {
    var houseUpdated: HouseUpdated?
  }
}
