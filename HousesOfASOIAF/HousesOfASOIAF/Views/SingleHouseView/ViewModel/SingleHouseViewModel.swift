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
        self.updateSingleCharacter(ofType: .founder)
        self.updateSingleCharacter(ofType: .currentLord)
        self.updateSingleCharacter(ofType: .heir)
        self.updateOverlord()
        self.updateSwornMembers()
        self.updateCadetBranches()
      }
    }
  }
  
  enum SingleHouseFieldType {
    case founder
    case currentLord
    case heir
  }
  
  private func getLinkField(
    forType type: SingleHouseFieldType,
    ofHouse house: HouseBasic
  ) -> String {
    switch type {
    case .founder:
      return house.foundedByCharacter
    case .currentLord:
      return house.currentLord
    case .heir:
      return house.heir
    }
  }
  
  private func updateHouseBasicField(
    ofType type: SingleHouseFieldType,
    withValue value: Character
  ) {
    switch type {
    case .founder:
      self.state.houseUpdated?.foundedByCharacter = value
    case .currentLord:
      self.state.houseUpdated?.currentLord = value
    case .heir:
      self.state.houseUpdated?.heir = value
    }
  }
  
  /// Updates a field that can contain a link when a link exists with the corresponding data.
  /// Sets error on failure.
  private func updateSingleCharacter(ofType type: SingleHouseFieldType) {
    let linkField = getLinkField(forType: type, ofHouse: houseBasic)
    
    if linkField.isLink {
      Api.fetch(Character.self, url: linkField) { result in
        switch result {
        case .success(let character):
          // Sets the value of the HouseUpdated to the just received value.
          self.updateHouseBasicField(ofType: type, withValue: character)
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
