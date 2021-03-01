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
  
  struct SingleHouseViewState {
    var houseUpdated: HouseUpdated?
    var showError = false
  }
  
  //MARK: - Single Field Update Functions
  
  /// Updates a field that can contain a link when a link
  /// exists with the corresponding data. Sets error on failure.
  private func updateSingleField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: SingleHouseFieldType
  ) {
    let linkField = getLinkField(forType: type)
    
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
  
  /// Enum for updatable fields that are not arrays.
  private enum SingleHouseFieldType {
    case founder
    case currentLord
    case heir
    case overlord
  }
  
  /// Returns the variables (and the therein saved
  /// link) that corresponds to the input enum.
  private func getLinkField(
    forType type: SingleHouseFieldType
  ) -> String {
    switch type {
    case .founder:
      return houseBasic.foundedByCharacter
    case .currentLord:
      return houseBasic.currentLord
    case .heir:
      return houseBasic.heir
    case .overlord:
      return houseBasic.overlordHouse
    }
  }
  
  /// Sets an input value to the variable
  /// that corresponds to the type.
  private func updateHouseBasicField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: SingleHouseFieldType,
    withValue value: T
  ) {
    switch type {
    case .founder:
      self.state.houseUpdated?.foundedByCharacter = value as? Character
    case .currentLord:
      self.state.houseUpdated?.currentLord = value as? Character
    case .heir:
      self.state.houseUpdated?.heir = value as? Character
    case.overlord:
      self.state.houseUpdated?.overlordHouse = value as? HouseBasic
    }
  }
  
  //MARK: - Array Update Functions
  
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
}
