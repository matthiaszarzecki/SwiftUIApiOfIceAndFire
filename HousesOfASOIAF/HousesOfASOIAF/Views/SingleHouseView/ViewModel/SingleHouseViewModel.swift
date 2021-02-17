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
    
    if houseBasic.containsLinks {
      // Not really happy about this, as it is quite over-fetching.
      // If the ApiOfIceAndFire were graphql-compatible that would
      // be much more straightforward!
      
      // TODO: Combine these functions into a single function with an enum parameter
      // TODO: use a combined publisher
      updateFounder()
      updateCurrentLord()
      updateHeir()
      updateOverlord()
      updateSwornMembers()
    }
  }
  
  func updateFounder() {
    if houseBasic.foundedByCharacter.isLink {
      Api.fetch(Character.self, url: houseBasic.foundedByCharacter) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.foundedByCharacter = character
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  func updateCurrentLord() {
    if houseBasic.currentLord.isLink {
      Api.fetch(Character.self, url: houseBasic.currentLord) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.currentLord = character
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  func updateHeir() {
    if houseBasic.heir.isLink {
      Api.fetch(Character.self, url: houseBasic.heir) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.heir = character
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  func updateOverlord() {
    if houseBasic.overlordHouse.isLink {
      Api.fetch(HouseBasic.self, url: houseBasic.overlordHouse) { result in
        switch result {
        case .success(let house):
          self.state.houseUpdated?.overlordHouse = house
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  func updateCadetBranches() {
    for index in 0..<houseBasic.cadetBranches.count {
      if houseBasic.cadetBranches[index].isLink {
        Api.fetch(HouseBasic.self, url: houseBasic.cadetBranches[index]) { result in
          switch result {
          case .success(let house):
            self.state.houseUpdated?.cadetBranches?[index] = house
          case .failure(let error):
            print("Error! \(error)")
            self.state.showError = true
          }
        }
      }
    }
  }
  
  func updateSwornMembers() {
    for index in 0..<houseBasic.swornMembers.count {
      if houseBasic.swornMembers[index].isLink {
        Api.fetch(Character.self, url: houseBasic.swornMembers[index]) { result in
          switch result {
          case .success(let character):
            self.state.houseUpdated?.swornMembers?[index] = character
          case .failure(let error):
            print("Error! \(error)")
            self.state.showError = true
          }
        }
      }
    }
  }
  
  struct SingleHouseViewState {
    var houseUpdated: HouseUpdated?
    var showError = false
  }
}
