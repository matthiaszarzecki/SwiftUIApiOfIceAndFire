//
//  SearchResultsListView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SearchResultsList: View {
  let searchResults: [House]
  let isLoading: Bool
  let onScrolledAtBottom: () -> Void
  
  var body: some View {
    // This cannot be a scrollview as that tanks the performance somehow
    List {
      ForEach(searchResults) { house in
        NavigationLink(
          destination: HouseView(house: house)
        ) {
          Text("\(house.name)")
        }
        
        .onAppear {
          if self.searchResults.last == house {
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
