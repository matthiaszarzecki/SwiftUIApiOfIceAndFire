//
//  HousesResultsViewModel.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import SwiftUI

enum AllHousesViewState {
  case loading
  case error
  case regularAndFinishedLoading
  case regularAndLoadingMore
}

protocol AllHousesViewModelProtocol: ObservableObject {
  var houses: [HouseBasic] { get set }
  var state: AllHousesViewState { get set }
  var viewTitle: String { get }

  func fetchNextPageIfPossible()
  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String)
}

final class AllHousesViewModel: AllHousesViewModelProtocol {
  let viewTitle = "All Houses of Westeros"

  @Published var houses: [HouseBasic] = []
  @Published var state: AllHousesViewState = .loading

  private var page = 1
  private var subscriptions = Set<AnyCancellable>()
  private let pageSize = 30
  private let downloader: HousesBasicDownloaderProtocol

  init(downloader: HousesBasicDownloaderProtocol = HousesBasicDownloader()) {
    self.downloader = downloader
    fetchNextPageIfPossible()
  }

  func fetchNextPageIfPossible() {
    guard state != .regularAndFinishedLoading else {
      return
    }

    if let publisher = downloader.getHouses(page: page, pageSize: pageSize) {
      publisher
        .sink(
          receiveCompletion: onReceive,
          receiveValue: onReceive
        )
        .store(in: &subscriptions)

      // If after 3 seconds nothing has been loaded, show error
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
        if self.subscriptions.isEmpty {
          state = .error
        }
      }
    } else {
      state = .error
    }
  }

  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {
    if
      let house10SpotsFromLast = houses[safe: houses.count - 10],
      house10SpotsFromLast.url == houseUrl
    {
      fetchNextPageIfPossible()
    }
  }

  // MARK: - Private Functions

  private func onReceive(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      state = .regularAndLoadingMore
    case .failure:
      state = .regularAndFinishedLoading
    }
  }

  private func onReceive(_ batch: [HouseBasic]) {
    houses += batch
    page += 1

    if batch.count != pageSize {
      state = .regularAndFinishedLoading
    }
  }
}

// MARK: - Mock view models
extension AllHousesViewModel {
  static let mockViewModelError = AllHousesMockViewModelError()
  static let mockViewModelLoading = AllHousesMockViewModelLoading()
  static let mockViewModelRegularAndNotLoadingMore = AllHousesMockViewModelRegularAndNotLoadingMore()
  static let mockViewModelRegularAndLoadingMore = AllHousesMockViewModelRegularAndLoadingMore()

  static let allMockViewModels: [any AllHousesViewModelProtocol] = [
    mockViewModelError,
    mockViewModelLoading,
    mockViewModelRegularAndNotLoadingMore,
    mockViewModelRegularAndLoadingMore
  ]
}

final class AllHousesMockViewModelError: AllHousesViewModelProtocol {
  var houses: [HouseBasic] = .mockHousesEmptyArray
  var state: AllHousesViewState = .error
  var viewTitle: String = "All Houses of Westeros"

  func fetchNextPageIfPossible() {}
  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {}
}

final class AllHousesMockViewModelLoading: AllHousesViewModelProtocol {
  var houses: [HouseBasic] = .mockHousesEmptyArray
  var state: AllHousesViewState = .loading
  var viewTitle: String = "All Houses of Westeros"

  func fetchNextPageIfPossible() {}
  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {}
}

final class AllHousesMockViewModelRegularAndNotLoadingMore: AllHousesViewModelProtocol {
  var houses: [HouseBasic] = .mockHousesBasic
  var state: AllHousesViewState = .regularAndFinishedLoading
  var viewTitle: String = "All Houses of Westeros"

  func fetchNextPageIfPossible() {}
  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {}
}

final class AllHousesMockViewModelRegularAndLoadingMore: AllHousesViewModelProtocol {
  var houses: [HouseBasic] = .mockHousesBasic
  var state: AllHousesViewState = .regularAndLoadingMore
  var viewTitle: String = "All Houses of Westeros"

  func fetchNextPageIfPossible() {}
  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {}
}
