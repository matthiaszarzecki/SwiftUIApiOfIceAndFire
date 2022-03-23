//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses.
struct AllHousesView: View {
  @ObservedObject private var allHousesViewModel = AllHousesViewModel()

  var body: some View {
    AllHousesDisplay(
      fetchResults: allHousesViewModel.state.houses,
      isLoading: allHousesViewModel.state.canLoadNextPage,
      showError: allHousesViewModel.state.showError,
      initialLoadingPhase: allHousesViewModel.state.intitialLoadingPhase,
      onScrolledAtBottom: allHousesViewModel.fetchNextPageIfPossible
    )
    .onAppear {
      allHousesViewModel.fetchNextPageIfPossible()
    }
  }
}

struct AllHousesDisplay: View {
  let fetchResults: [HouseBasic]
  let isLoading: Bool
  var showError: Bool
  var initialLoadingPhase: Bool
  let onScrolledAtBottom: () -> Void

  private let viewTitle = "All Houses of Westeros"

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
          ForEach(fetchResults) { house in
            NavigationLink(
              destination: SingleHouseView(houseBasic: house)
            ) {
              HouseCellBasic(
                house: house,
                iconSize: .largeForMajorCells
              )
            }
            .onAppear {
              if self.fetchResults.last == house {
                self.onScrolledAtBottom()
              }
            }
          }

          if isLoading {
            TinyLoadingIndicator()
              .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
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
    Group {
      AllHousesDisplay(
        fetchResults: .mockHousesBasic,
        isLoading: false,
        showError: false,
        initialLoadingPhase: false
      ) {}

      AllHousesDisplay(
        fetchResults: .mockHousesBasic,
        isLoading: true,
        showError: false,
        initialLoadingPhase: false
      ) {}

      AllHousesDisplay(
        fetchResults: .mockHousesBasic,
        isLoading: true,
        showError: true,
        initialLoadingPhase: false
      ) {}

      AllHousesDisplay(
        fetchResults: .mockHousesBasic,
        isLoading: true,
        showError: false,
        initialLoadingPhase: true
      ) {}
    }
  }
}
#endif
