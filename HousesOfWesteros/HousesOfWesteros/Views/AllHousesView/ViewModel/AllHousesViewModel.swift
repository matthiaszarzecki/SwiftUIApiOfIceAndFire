//
//  HousesResultsViewModel.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import SwiftUI

class AllHousesViewModel: ObservableObject {
  @Published private(set) var state = SearchResultsViewState()
  private var subscriptions = Set<AnyCancellable>()

  public func fetchNextPageIfPossible() {
    guard state.canLoadNextPage else {
      return
    }

    Api.getHouses(page: state.page)
      .sink(
        receiveCompletion: onReceive,
        receiveValue: onReceive
      )
      .store(in: &subscriptions)

    // If after 3 seconds nothing has been loaded, show error
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
      if self.subscriptions.isEmpty {
        state.intitialLoadingPhase = false
        state.showError = true
      }
    }
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
    state.canLoadNextPage = batch.count == Api.pageSize
  }

  struct SearchResultsViewState {
    var houses: [HouseBasic] = []
    var page = 1
    var canLoadNextPage = true
    var showError = false
    var intitialLoadingPhase = true
  }
}
