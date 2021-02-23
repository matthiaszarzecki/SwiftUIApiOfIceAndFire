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
  
  /// Updates nested links with additional data.
  /// For error-testing set showError to turn up true within here.
  public func getDataFromNestedLinks() {
    /// Turns the input House into a HouseUpdated
    /// by fetching data from locally saved URL's.
    state.houseUpdated = HouseUpdated(fromHouse: houseBasic)
    
    if houseBasic.containsLinks {
      DispatchQueue.main.async {
        // Not really happy about this, as it is quite over-fetching.
        // If the ApiOfIceAndFire were graphql-compatible that would
        // be much more straightforward!
        
        // TODO: Combine these functions into a single function with an enum parameter
        // TODO: use a combined publisher
        self.updateFounder()
        self.updateCurrentLord()
        self.updateHeir()
        self.updateOverlord()
        self.updateSwornMembers()
      }
    }
  }
  
  private func updateFounder() {
    if houseBasic.foundedByCharacter.isLink {
      Api.fetch(Character.self, url: houseBasic.foundedByCharacter) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.foundedByCharacter = character
          self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  private func updateCurrentLord() {
    if houseBasic.currentLord.isLink {
      Api.fetch(Character.self, url: houseBasic.currentLord) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.currentLord = character
          self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  private func updateHeir() {
    if houseBasic.heir.isLink {
      Api.fetch(Character.self, url: houseBasic.heir) { result in
        switch result {
        case .success(let character):
          self.state.houseUpdated?.heir = character
          self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  private func updateOverlord() {
    if houseBasic.overlordHouse.isLink {
      Api.fetch(HouseBasic.self, url: houseBasic.overlordHouse) { result in
        switch result {
        case .success(let house):
          self.state.houseUpdated?.overlordHouse = house
          self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  private func updateCadetBranches() {
    for index in 0..<houseBasic.cadetBranches.count {
      if houseBasic.cadetBranches[index].isLink {
        Api.fetch(HouseBasic.self, url: houseBasic.cadetBranches[index]) { result in
          switch result {
          case .success(let house):
            self.state.houseUpdated?.cadetBranches?[index] = house
            self.state.showError = false
          case .failure(let error):
            print("Error! \(error)")
            self.state.showError = true
          }
        }
      }
    }
  }
  
  private func updateSwornMembers() {
    for index in 0..<houseBasic.swornMembers.count {
      if houseBasic.swornMembers[index].isLink {
        Api.fetch(Character.self, url: houseBasic.swornMembers[index]) { result in
          switch result {
          case .success(let character):
            self.state.houseUpdated?.swornMembers?[index] = character
            self.state.showError = false
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
