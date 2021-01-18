//
//  ContentView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HousesView: View {
  @ObservedObject private var viewModel = HousesResultsViewModel()
  
  var body: some View {
    NavigationView {
      SearchResultsList(
        searchResults: viewModel.state.houses,
        isLoading: viewModel.state.canLoadNextPage,
        onScrolledAtBottom: viewModel.fetchNextPageIfPossible
      )
      .navigationTitle("ASOIAF Houses 🛡️")
      .onAppear(perform: viewModel.fetchNextPageIfPossible)
    }
  }
}

struct HousesView_Previews: PreviewProvider {
  static var previews: some View {
    HousesView()
  }
}
