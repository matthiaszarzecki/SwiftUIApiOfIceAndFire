//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses
struct AllHousesView: View {
  @ObservedObject private var allHousesViewModel = AllHousesViewModel()
  
  init() {
    // Set font for Title in large view
    UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 24)!]
    
    // Set font for Title in navigation bar
    UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "GameofThrones", size: 16)!]
  }
  
  var body: some View {
    NavigationView {
      AllHousesDisplay(
        fetchResults: allHousesViewModel.state.houses,
        isLoading: allHousesViewModel.state.canLoadNextPage,
        showError: allHousesViewModel.state.showError,
        intitialLoadingPhase: allHousesViewModel.state.intitialLoadingPhase,
        onScrolledAtBottom: allHousesViewModel.fetchNextPageIfPossible
      )
      .navigationTitle("Houses of Westeros")
      .onAppear {
        allHousesViewModel.fetchNextPageIfPossible()
      }
    }
    .accentColor(.westerosRed)
  }
}

struct AllHousesDisplay: View {
  let fetchResults: [HouseBasic]
  let isLoading: Bool
  var showError: Bool
  var intitialLoadingPhase: Bool
  let onScrolledAtBottom: () -> Void
  
  var body: some View {
    if intitialLoadingPhase {
      AllHousesLoadingView()
    } else if showError {
      ErrorDisplay(reloadData: onScrolledAtBottom)
    } else {
      // This cannot be a scrollview as that tanks the performance
      List {
        ForEach(fetchResults) { house in
          SingleHouseCell(house: house)
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
    }
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
