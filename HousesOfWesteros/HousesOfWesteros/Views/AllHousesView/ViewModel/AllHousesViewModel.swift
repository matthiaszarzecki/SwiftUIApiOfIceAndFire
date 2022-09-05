//
//  HousesResultsViewModel.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import SwiftUI

final class AllHousesViewModel: ObservableObject {
  struct SearchResultsViewState {
    var houses: [HouseBasic] = []
    var page = 1
    var canLoadNextPage = true
    var showError = false
    var intitialLoadingPhase = true
  }

  @Published private(set) var state = SearchResultsViewState()

  let viewTitle = "All Houses of Westeros"

  private var subscriptions = Set<AnyCancellable>()
  private let pageSize = 30

  func fetchNextPageIfPossible() {
    guard state.canLoadNextPage else {
      return
    }

    if let publisher = Api.shared.getHouses(page: state.page, pageSize: pageSize) {
      publisher
        .sink(
          receiveCompletion: onReceive,
          receiveValue: onReceive
        )
        .store(in: &subscriptions)

      // If after 3 seconds nothing has been loaded, show error
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
        if self.subscriptions.isEmpty {
          showError()
        }
      }
    } else {
      showError()
    }
  }

  func checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: String) {
    if state.houses.last?.url == houseUrl {
      fetchNextPageIfPossible()
    }
  }

  // MARK: - Private Functions

  private func showError() {
    state.showError = true
    state.intitialLoadingPhase = false
  }

  private func onReceive(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      state.showError = false
      state.intitialLoadingPhase = false
    case .failure:
      state.canLoadNextPage = false
    }
  }

  private func onReceive(_ batch: [HouseBasic]) {
    state.houses += batch
    state.page += 1
    state.canLoadNextPage = batch.count == pageSize
  }
}
