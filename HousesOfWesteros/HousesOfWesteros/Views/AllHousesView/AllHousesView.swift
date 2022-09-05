//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses.
struct AllHousesView: View {
  @ObservedObject private var viewModel = AllHousesViewModel()

  var body: some View {
    AllHousesDisplay(
      houses: viewModel.state.houses,
      isLoading: viewModel.state.canLoadNextPage,
      showError: viewModel.state.showError,
      initialLoadingPhase: viewModel.state.intitialLoadingPhase,
      viewTitle: viewModel.viewTitle,
      shouldLoadNextBatch: viewModel.shouldLoadNextBatch,
      onScrolledAtBottom: viewModel.fetchNextPageIfPossible
    )
    .onAppear {
      viewModel.fetchNextPageIfPossible()
    }
  }
}

struct AllHousesDisplay: View {
  let houses: [HouseBasic]
  let isLoading: Bool
  let showError: Bool
  let initialLoadingPhase: Bool
  let viewTitle: String
  let shouldLoadNextBatch: (_ house: HouseBasic) -> Bool
  let onScrolledAtBottom: () -> Void

  var body: some View {
    NavigationView {
      if showError {
        ErrorDisplay(reloadData: onScrolledAtBottom)
          .navigationTitle(viewTitle)
      } else if initialLoadingPhase {
        AllHousesLoadingView()
          .navigationTitle(viewTitle)
      } else {
        // This cannot be a scrollview as
        // that tanks the performance.
        List {
          ForEach(houses) { house in
            NavigationLink(
              destination: SingleHouseView(houseBasic: house)
            ) {
              HouseCellBasic(
                house: house,
                iconSize: .largeForMajorCells
              )
            }
            .onAppear {
              if shouldLoadNextBatch(house) {
                self.onScrolledAtBottom()
              }
            }
          }

          if isLoading {
            TinyLoadingIndicator()
              .frame(
                idealWidth: .infinity,
                maxWidth: .infinity,
                alignment: .center
              )
          }
        }
        .navigationTitle(viewTitle)
      }
    }
    .accentColor(.westerosRed)
  }
}

#if !TESTING
struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    let configurations: [(
      houses: [HouseBasic],
      isLoading: Bool,
      showError: Bool,
      initialLoadingPhase: Bool
    )] = [
      (.mockHousesBasic, false, false, false),
      (.mockHousesBasic, true, false, false),
      (.mockHousesBasic, true, true, false),
      (.mockHousesBasic, true, false, true)
    ]

    ForEach(0..<configurations.count, id: \.self) { index in
      let configuration = configurations[index]
      AllHousesDisplay(
        houses: configuration.houses,
        isLoading: configuration.isLoading,
        showError: configuration.showError,
        initialLoadingPhase: configuration.initialLoadingPhase,
        viewTitle: "All Houses of Westeros",
        shouldLoadNextBatch: { _ in false },
        onScrolledAtBottom: {}
      )
    }
  }
}
#endif
