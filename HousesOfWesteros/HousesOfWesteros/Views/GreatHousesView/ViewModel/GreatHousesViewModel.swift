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

  private let downloader: SingleHouseBasicDownloaderProtocol

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
