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
      intitialLoadingPhase: allHousesViewModel.state.intitialLoadingPhase,
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
  var intitialLoadingPhase: Bool
  let onScrolledAtBottom: () -> Void
  
  private let viewTitle = "All Houses of Westeros"
  
  var body: some View {
    NavigationView {
      if intitialLoadingPhase {
        AllHousesLoadingView()
          .navigationTitle(viewTitle)
      } else if showError {
        ErrorDisplay(reloadData: onScrolledAtBottom)
          .navigationTitle(viewTitle)
      } else {
        // This cannot be a scrollview as
        // that tanks the performance.
        List {
          ForEach(fetchResults) { house in
            NavigationLink(
              destination: SingleHouseView(houseBasic: house)
            ) {
              HouseCellBasic(house: house, iconSize: .largeForMajorCells)
            }
            .onAppear {
              if self.fetchResults.last == house {
                self.onScrolledAtBottom()
              }
            }
          }
          
          if isLoading {
            SearchSpinnerView()
              .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
          }
        }
        .navigationTitle(viewTitle)
      }
    }
    .accentColor(.westerosRed)
  }
}

struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: false,
        showError: false,
        intitialLoadingPhase: false,
        onScrolledAtBottom: {}
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: true,
        showError: false,
        intitialLoadingPhase: false,
        onScrolledAtBottom: {}
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: true,
        showError: true,
        intitialLoadingPhase: false,
        onScrolledAtBottom: {}
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: true,
        showError: false,
        intitialLoadingPhase: true,
        onScrolledAtBottom: {}
      )
    }
  }
}
