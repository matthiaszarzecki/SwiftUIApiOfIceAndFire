//
//  GreatHousesViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import Foundation

class GreatHousesViewModel: ObservableObject {
  @Published private(set) var state = GreatHousesViewState()
  
  init() {
    for (index, id) in Constants.greatHouses.enumerated() {
      Api.getSingleHouse(id: id) { result in
        switch result {
        case .success(let receivedObject):
          self.state.houses[index] = receivedObject
        case .failure(let error):
          print("Error! \(error)")
        }
      }
    }
  }
  
  struct GreatHousesViewState {
    // The great houses are always supposed
    // to be in the same order, therefore
    // we create slots for them here.
    var houses: [HouseBasic?] = Array(repeating: nil, count: Constants.greatHouses.count)
  }
}
