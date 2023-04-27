//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses.
struct AllHousesView<T: AllHousesViewModelProtocol>: View {
  @ObservedObject private var viewModel: T

  private var loadingView: some View {
    AllHousesLoadingView()
  }

  private var errorView: some View {
    ErrorDisplay(
      viewModel: ErrorDisplayViewModel { viewModel.fetchNextPageIfPossible() }
    )
  }

  private var regularViewAndLoadingMoreView: some View {
    ScrollView {
      LazyVStack {
        houseElements
        TinyLoadingIndicator()
          .padding()
      }
    }
  }

  private var regularViewAndNotLoadingMoreView: some View {
    ScrollView {
      LazyVStack {
        houseElements
      }
    }
  }

  private var houseElements: some View {
    ForEach(viewModel.houses) { house in
      var height: CGFloat = 60
      if house.isGreatHouse {
        height = 100
      }

      return NavigationLink(
        destination: SingleHouseView(viewModel: SingleHouseViewModel(houseBasic: house))
      ) {
        GeometryReader { geometry in
          let spacing: CGFloat = .spacing16
          let width = geometry.size.width - spacing * 2

          if house.isGreatHouse {
            HouseCellLarge(
              viewModel: HouseCellLargeViewModel(house),
              width: width
            )
            .padding(.leading, spacing)
          } else {
            HouseCellBasicForVStack(
              house: house,
              iconSize: .largeForMajorCells,
              width: width
            )
            .padding(.leading, spacing)
          }
        }
      }
      .frame(height: height)
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
        case .regularAndFinishedLoading:
          regularViewAndNotLoadingMoreView
        case .regularAndLoadingMore:
          regularViewAndLoadingMoreView
        }
      }
      .navigationTitle(viewModel.viewTitle)
    }
    .accentColor(.westerosRed)
  }

  init(viewModel: T) {
    self.viewModel = viewModel
  }
}

#if !TESTING
struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    AllHousesView(viewModel: AllHousesMockRegularAndNotLoadingMore())
      .previewDisplayName("RegularAndNotLoadingMore")
    AllHousesView(viewModel: AllHousesMockRegularAndLoadingMore())
      .previewDisplayName("RegularAndLoadingMore")
    AllHousesView(viewModel: AllHousesMockError())
      .previewDisplayName("Error")
    AllHousesView(viewModel: AllHousesMockLoading())
      .previewDisplayName("Loading")
  }
}
#endif
