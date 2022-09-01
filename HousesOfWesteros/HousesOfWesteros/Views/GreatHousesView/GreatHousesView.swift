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
  let houses: [HouseBasic?]

  private let viewTitle = "Great Houses of Westeros"

  /// A boolean indicating whether houses
  /// contains at least 1 non-nil entry.
  private var hasViableEntries: Bool {
    for house in houses where house != nil {
      return true
    }
    return false
  }

  var body: some View {
    GeometryReader { geometry in
      let spacing: CGFloat = .spacing32
      let elementWidth = geometry.size.width - spacing * 2

      NavigationView {
        if hasViableEntries {
          ScrollView {
            ForEach(houses, id: \.self) { house in
              if let unwrappedHouse = house {
                ZStack {
                  NavigationLink(
                    destination: SingleHouseView(houseBasic: unwrappedHouse)
                  ) {
                    HouseCellLarge(
                      viewModel: HouseCellLargeViewModel(unwrappedHouse),
                      width: elementWidth
                    )
                    // Padding to work around ScrollView auto-constricting
                    .padding(.horizontal, spacing)
                  }
                  .buttonStyle(PlainButtonStyle())
                }
              }
            }
            .frame(width: geometry.size.width)
            .listRowBackground(Color.clear)
          }
          .navigationTitle(viewTitle)
        } else {
          GreatHousesLoadingView(width: elementWidth)
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
      houses: .mockHousesBasic
    )

    GreatHousesDisplay(
      houses: .mockHousesEmtpyArray
    )
  }
}
#endif
