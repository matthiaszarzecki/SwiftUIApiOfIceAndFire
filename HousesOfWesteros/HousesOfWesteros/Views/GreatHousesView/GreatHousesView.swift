//
//  GreatHousesView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct GreatHousesView: View {
  @ObservedObject private var viewModel = GreatHousesViewModel()

  var body: some View {
    GreatHousesDisplay(
      houses: viewModel.state.houses,
      hasViableEntries: viewModel.hasViableEntries,
      viewTitle: viewModel.viewTitle
    )
  }
}

struct GreatHousesDisplay: View {
  let houses: [HouseBasic?]
  let hasViableEntries: Bool
  let viewTitle: String

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
                    destination: SingleHouseView(
                      viewModel: SingleHouseViewModel(houseBasic: unwrappedHouse)
                    )
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
      houses: .mockHousesBasic,
      hasViableEntries: true,
      viewTitle: "Great Houses of Westeros"
    )

    GreatHousesDisplay(
      houses: .mockHousesEmptyArray,
      hasViableEntries: true,
      viewTitle: "Great Houses of Westeros"
    )
  }
}
#endif
