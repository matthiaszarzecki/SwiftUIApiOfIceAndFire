//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

// TODO: Insert ViewModel
// TODO: Create Mock ViewModel
// TODO: Fix Loading Logic
// TODO: Fix Loading Indicator
// TODO: Rename variables
// TODO: Check which variables in viewmodel can be private

/// Shows a list of all ASOIAF Houses.
struct AllHousesView: View {
  @ObservedObject private var viewModel = AllHousesViewModel()

  var body: some View {
    NavigationView {
      if viewModel.showError {
        ErrorDisplay(reloadData: viewModel.fetchNextPageIfPossible)
          .navigationTitle(viewModel.viewTitle)
      } else if viewModel.initialLoadingPhase {
        AllHousesLoadingView()
          .navigationTitle(viewModel.viewTitle)
      } else {
        // This cannot be a scrollview as
        // that tanks the performance.
        List {
          ForEach(viewModel.houses) { house in
            NavigationLink(
              destination: SingleHouseView(houseBasic: house)
            ) {
              HouseCellBasic(
                house: house,
                iconSize: .largeForMajorCells
              )
            }
            .onAppear {
              viewModel.checkIfNextBatchShouldBeLoadedAndLoad(houseUrl: house.url)
            }
          }

          if viewModel.initialLoadingPhase {
            TinyLoadingIndicator()
              .frame(
                idealWidth: .infinity,
                maxWidth: .infinity,
                alignment: .center
              )
          }
        }
        .navigationTitle(viewModel.viewTitle)
      }
    }
    .accentColor(.westerosRed)
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
  let checkIfNextBatchShouldBeLoadedAndLoad: (_ houseUrl: String) -> Void
  let loadNextBatch: () -> Void

  var body: some View {
    Text("Hello")
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
        checkIfNextBatchShouldBeLoadedAndLoad: { _ in },
        loadNextBatch: {}
      )
    }
  }
}
#endif
