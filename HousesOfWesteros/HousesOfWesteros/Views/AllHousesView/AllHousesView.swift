//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses.
struct AllHousesView: View {
  @ObservedObject private var viewModel: AllHousesViewModel

  private var loadingView: some View {
    AllHousesLoadingView()
  }

  private var errorView: some View {
    ErrorDisplay { viewModel.fetchNextPageIfPossible() }
  }

  private var regularViewAndLoadingMore: some View {
    // This cannot be a scrollview as
    // that tanks the performance.
    List {
      houseElements
      TinyLoadingIndicator()
    }
  }

  private var regularViewAndNotLoadingMore: some View {
    // This cannot be a scrollview as
    // that tanks the performance.
    List {
      houseElements
    }
  }

  private var houseElements: some View {
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
  }

  var body: some View {
    NavigationView {
      Group {
        switch viewModel.state {
        case .loading:
          loadingView
        case .error:
          errorView
        case .regularAndNotLoadingMore:
          regularViewAndNotLoadingMore
        case .regularAndLoadingMore:
          regularViewAndLoadingMore
        }
      }
      .navigationTitle(viewModel.viewTitle)
    }
    .accentColor(.westerosRed)
  }

  init(viewModel: AllHousesViewModel = AllHousesViewModel()) {
    self.viewModel = viewModel
  }
}

#if !TESTING
struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    let configurations: [AllHousesViewModel] = [
      .mockViewModelLoading,
      .mockViewModelError,
      .mockViewModelRegularAndLoadingMore,
      .mockViewModelRegularAndNotLoadingMore
    ]

    ForEach(0..<configurations.count, id: \.self) { index in
      let configuration = configurations[index]
      AllHousesView(viewModel: configuration)
    }
  }
}
#endif
