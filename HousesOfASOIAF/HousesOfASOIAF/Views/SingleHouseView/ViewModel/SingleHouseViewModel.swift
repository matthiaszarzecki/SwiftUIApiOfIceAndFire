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
        self.updateSingleField(Character.self, ofType: .founder)
        self.updateSingleField(Character.self, ofType: .currentLord)
        self.updateSingleField(Character.self, ofType: .heir)
        self.updateSingleField(HouseBasic.self, ofType: .overlord)
        
        self.updateSwornMembers()
        self.updateCadetBranches()
      }
    }
  }
  
  enum SingleHouseFieldType {
    case founder
    case currentLord
    case heir
    case overlord
    //case swornMembers
    //case cadetBranches
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
    case .overlord:
      return house.overlordHouse
    }
  }
  
  private func updateHouseBasicField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: SingleHouseFieldType,
    withValue value: T
  ) {
    switch type {
    case .founder:
      if let character = value as? Character {
        self.state.houseUpdated?.foundedByCharacter = character
      }
    case .currentLord:
      if let character = value as? Character {
        self.state.houseUpdated?.currentLord = character
      }
    case .heir:
      if let character = value as? Character {
        self.state.houseUpdated?.heir = character
      }
    case.overlord:
      if let houseBasic = value as? HouseBasic {
        self.state.houseUpdated?.overlordHouse = houseBasic
      }
    }
  }
  
  /// Updates a field that can contain a link when a link
  /// exists with the corresponding data. Sets error on failure.
  private func updateSingleField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: SingleHouseFieldType
  ) {
    let linkField = getLinkField(forType: type, ofHouse: houseBasic)
    
    if linkField.isLink {
      Api.fetch(T.self, url: linkField) { result in
        switch result {
        case .success(let receivedObject):
          // Sets the value of the HouseUpdated to the just received value.
          self.updateHouseBasicField(T.self, ofType: type, withValue: receivedObject)
          
          self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self.state.showError = true
        }
      }
    }
  }
  
  private func updateCadetBranches() {
    if houseBasic.cadetBranches.hasLinkEntries {
      // Create new empty array
      self.state.houseUpdated?.cadetBranches = [HouseBasic]()
      
      for index in 0..<houseBasic.cadetBranches.count {
        if houseBasic.cadetBranches[index].isLink {
          Api.fetch(HouseBasic.self, url: houseBasic.cadetBranches[index]) { result in
            switch result {
            case .success(let house):
              self.state.houseUpdated?.cadetBranches?.append(house)
              
              self.state.showError = false
            case .failure(let error):
              print("Error! \(error)")
              self.state.showError = true
            }
          }
        }
      }
    }
  }
  
  private func updateSwornMembers() {
    if houseBasic.swornMembers.hasLinkEntries {
      // Create new empty array
      self.state.houseUpdated?.swornMembers = [Character]()
      
      for index in 0..<houseBasic.swornMembers.count {
        if houseBasic.swornMembers[index].isLink {
          Api.fetch(Character.self, url: houseBasic.swornMembers[index]) { result in
            switch result {
            case .success(let character):
              self.state.houseUpdated?.swornMembers?.append(character)
              self.state.showError = false
            case .failure(let error):
              print("Error! \(error)")
              self.state.showError = true
            }
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
