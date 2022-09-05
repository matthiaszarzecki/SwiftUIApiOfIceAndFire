//
//  GreatHousesViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import Foundation

class GreatHousesViewModel: ObservableObject {
  struct GreatHousesViewState {
    // The great houses are always supposed
    // to be in the same order, therefore
    // we create slots for them here.
    var houses: [HouseBasic?] = Array(repeating: nil, count: Constants.greatHouses.count)
  }

  @Published private(set) var state = GreatHousesViewState()
  let viewTitle = "Great Houses of Westeros"

  private let downloader: SingleHouseBasicDownloaderProtocol

  /// A boolean indicating whether houses
  /// contains at least 1 non-nil entry.
  var hasViableEntries: Bool {
    for house in state.houses where house != nil {
      return true
    }
    return false
  }

  init(
    downloader: SingleHouseBasicDownloaderProtocol = SingleHouseBasicDownloader()
  ) {
    self.downloader = downloader

    loadAllGreatHouses()
  }

  func loadAllGreatHouses() {
    for (index, id) in Constants.greatHouses.enumerated() {
      downloader.getSingleHouse(id: id) { [weak self] result in
        switch result {
        case .success(let receivedObject):
          self?.state.houses[index] = receivedObject
        case .failure(let error):
          print("Error! \(error)")
        }
      }
    }
  }
}
