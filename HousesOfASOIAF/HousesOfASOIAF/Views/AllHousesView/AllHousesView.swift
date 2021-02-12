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
  
  var body: some View {
    NavigationView {
      AllHousesDisplay(
        fetchResults: allHousesViewModel.state.houses,
        isLoading: allHousesViewModel.state.canLoadNextPage,
        onScrolledAtBottom: allHousesViewModel.fetchNextPageIfPossible
      )
      .navigationTitle("Houses of ASOIAF 🛡️")
      .onAppear(perform: allHousesViewModel.fetchNextPageIfPossible)
    }
  }
}

struct AllHousesDisplay: View {
  let fetchResults: [HouseBasic]
  let isLoading: Bool
  let onScrolledAtBottom: () -> Void
  
  var body: some View {
    // This cannot be a scrollview as that tanks the performance
    List {
      ForEach(fetchResults) { house in
        NavigationLink(
          destination: SingleHouseView(houseBasic: house)
        ) {
          HStack {
            if let colors = house.heraldryColors, colors.hasEntries {
              let circleSize: CGFloat = 32
              CircularColorDisplay(colors: colors)
                .frame(width: circleSize, height: circleSize, alignment: .center)
            }
            
            Text("\(house.name)")
            
            // When the house contains subnavigatable
            // pages & info show it here with an icon.
            if house.containsLinks {
              Image(systemName: "link")
            }
          }
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
  }
}

struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: false,
        onScrolledAtBottom: {}
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        isLoading: true,
        onScrolledAtBottom: {}
      )
    }
  }
}
