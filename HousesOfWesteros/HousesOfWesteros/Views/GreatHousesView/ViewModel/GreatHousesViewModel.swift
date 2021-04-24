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
    for id in Constants.greatHouses {
      Api.getSingleHouse(id: id) { result in
        switch result {
        case .success(let receivedObject):
          self.state.houses.append(receivedObject)
        case .failure(let error):
          print("Error! \(error)")
        }
      }
    }
  }
  
  struct GreatHousesViewState {
    var houses = [HouseBasic]()
  }
}
