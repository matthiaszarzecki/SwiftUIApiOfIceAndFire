//
//  GreatHousesView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct GreatHousesView: View {
  @ObservedObject private var greatHousesViewModel = GreatHousesViewModel(
    downloader: SingleHouseBasicDownloader()
  )

  var body: some View {
    GreatHousesDisplay(
      houses: greatHousesViewModel.state.houses
    )
  }
}

struct GreatHousesDisplay: View {
  var houses: [HouseBasic?]

  private let viewTitle = "Great Houses of Westeros"

  /// A boolean indicating whether houses
  /// contains at least 1 non-nil entry.
  var hasViableEntries: Bool {
    for house in houses where house != nil {
      return true
    }
    return false
  }

  var body: some View {
    GeometryReader { geometry in
      NavigationView {
        if hasViableEntries {
          List {
            ForEach(houses, id: \.self) { house in
              if let unwrappedHouse = house {
                ZStack {
                  NavigationLink(
                    destination: SingleHouseView(houseBasic: unwrappedHouse)
                  ) {
                    // Workaround to remove indicators
                    EmptyView()
                  }
                  .buttonStyle(PlainButtonStyle())

                  HouseCellLarge(
                    house: unwrappedHouse,
                    width: geometry.size.width - 38 * 2
                  )
                }
              }
            }
            .listRowBackground(Color.clear)
          }
          .navigationTitle(viewTitle)
        } else {
          GreatHousesLoadingView(width: geometry.size.width - 38 * 2)
            .navigationTitle(viewTitle)
        }
      }
    }
  }
}

#if !TESTING
struct GreatHousesView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesDisplay(
      houses: .housesBasic
    )

    GreatHousesDisplay(
      houses: [HouseBasic]()
    )
  }
}
#endif
