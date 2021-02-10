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
  
  func fetchNextPageIfPossible() {
    guard state.canLoadNextPage else {
      return
    }
    
    Api.getHouses(page: state.page)
      .sink(
        receiveCompletion: onReceive,
        receiveValue: onReceive
      )
      .store(in: &subscriptions)
  }
  
  private func onReceive(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      break
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
    var houses = [HouseBasic]()
    var page: Int = 1
    var canLoadNextPage = true
  }
}
