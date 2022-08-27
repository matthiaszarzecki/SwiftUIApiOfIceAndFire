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
  /// For error-testing set showError to turn up
  /// true within this function.
  internal func getDataFromNestedLinks() {
    // Turns the input House into a HouseUpdated
    // by fetching data from locally saved URL's.
    state.houseUpdated = HouseUpdated(fromHouse: houseBasic)

    if houseBasic.containsLinks {
      DispatchQueue.main.async {
        self.updateSingleField(CharacterBasic.self, ofType: .founder)
        self.updateSingleField(CharacterBasic.self, ofType: .currentLord)
        self.updateSingleField(CharacterBasic.self, ofType: .heir)
        self.updateSingleField(HouseBasic.self, ofType: .overlord)

        self.updateArrayField(CharacterBasic.self, ofType: .swornMembers)
        self.updateArrayField(HouseBasic.self, ofType: .cadetBranches)
      }
    }
  }

  struct SingleHouseViewState {
    var houseUpdated: HouseUpdated?
    var showError = false
  }

  // MARK: - Single Field Update Functions

  /// Updates a field that can contain a link when a link
  /// exists with the corresponding data. Sets error on failure.
  private func updateSingleField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: SingleHouseFieldType
  ) {
    let linkField = getSingleLinkField(forType: type)

    if linkField.isLink {
      Api.shared.fetch(T.self, url: linkField) { [weak self] result in
        switch result {
        case .success(let receivedObject):
          // Sets the value of the HouseUpdated
          // to the just received value.
          self?.updateHouseBasicField(
            T.self,
            ofType: type,
            withValue: receivedObject
          )

          self?.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          self?.state.showError = true
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
  private func getSingleLinkField(
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
      self.state.houseUpdated?.foundedByCharacter = value as? CharacterBasic
    case .currentLord:
      self.state.houseUpdated?.currentLord = value as? CharacterBasic
    case .heir:
      self.state.houseUpdated?.heir = value as? CharacterBasic
    case.overlord:
      self.state.houseUpdated?.overlordHouse = value as? HouseBasic
    }
  }

  // MARK: - Array Update Functions

  /// Updates a nested field that contains data as an array.
  private func updateArrayField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: ArrayHouseFieldType
  ) {
    let arrayField = getArrayLinkField(forType: type)

    if arrayField.hasLinkEntries {
      createArray(ofType: type)

      for index in 0..<arrayField.count where arrayField[index].isLink {
        Api.shared.fetch(T.self, url: arrayField[index]) { [weak self] result in
          switch result {
          case .success(let receivedObject):
            // Sets the value of the HouseUpdated
            // to the just received value.
            self?.updateHouseUpdatedArrayField(
              T.self,
              ofType: type,
              withValue: receivedObject
            )

            self?.state.showError = false
          case .failure(let error):
            print("Error! \(error)")
            self?.state.showError = true
          }
        }
      }
    }
  }

  /// Enum for updatable fields that are arrays.
  private enum ArrayHouseFieldType {
    case cadetBranches
    case swornMembers
  }

  /// Returns the array (and the therein saved
  /// links) that corresponds to the input enum.
  private func getArrayLinkField(
    forType type: ArrayHouseFieldType
  ) -> [String] {
    switch type {
    case .cadetBranches:
      return houseBasic.cadetBranches
    case .swornMembers:
      return houseBasic.swornMembers
    }
  }

  /// Creates a new array in the variable
  /// that corresponds to the input type.
  private func createArray(ofType type: ArrayHouseFieldType) {
    switch type {
    case .cadetBranches:
      self.state.houseUpdated?.cadetBranches = []
    case .swornMembers:
      self.state.houseUpdated?.swornMembers = []
    }
  }

  /// Sets the input value to the array
  /// that corresponds to the type.
  private func updateHouseUpdatedArrayField<T: Codable>(
    _ for: T.Type = T.self,
    ofType type: ArrayHouseFieldType,
    withValue value: T
  ) {
    switch type {
    case .cadetBranches:
      if let houseBasic = value as? HouseBasic {
        self.state.houseUpdated?.cadetBranches?.append(houseBasic)
      }
    case .swornMembers:
      if let character = value as? CharacterBasic {
        self.state.houseUpdated?.swornMembers?.append(character)
      }
    }
  }
}
