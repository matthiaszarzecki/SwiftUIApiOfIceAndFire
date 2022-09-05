//
//  HousesResultsViewModel.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import SwiftUI

final class AllHousesViewModel: ObservableObject {
  enum AllHousesViewState {
    case loading
    case error
    case regular
  }

  let viewTitle = "All Houses of Westeros"

  @Published private(set) var houses: [HouseBasic] = []
  @Published private(set) var state: AllHousesViewState = .loading

  private var page = 1
  private var canLoadNextPage = true
  private var subscriptions = Set<AnyCancellable>()
  private let pageSize = 30

  func fetchNextPageIfPossible() {
    guard canLoadNextPage else {
      return
    }

    if let publisher = Api.shared.getHouses(page: page, pageSize: pageSize) {
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
    if houses.last?.url == houseUrl {
      fetchNextPageIfPossible()
    }
  }

  // MARK: - Private Functions

  private func onReceive(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      state = .regular
    case .failure:
      canLoadNextPage = false
    }
  }

  private func onReceive(_ batch: [HouseBasic]) {
    houses += batch
    page += 1
    canLoadNextPage = batch.count == pageSize
  }
}
