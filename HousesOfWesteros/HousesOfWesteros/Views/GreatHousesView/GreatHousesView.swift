//
//  GreatHousesView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

struct GreatHousesView: View {
  @ObservedObject private var viewModel: GreatHousesViewModel

  var body: some View {
    GeometryReader { geometry in
      let spacing: CGFloat = .spacing32
      let elementWidth = geometry.size.width - spacing * 2

      NavigationView {
        if viewModel.hasViableEntries {
          ScrollView {
            ForEach(viewModel.state.houses, id: \.self) { house in
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
          .navigationTitle(viewModel.viewTitle)
        } else {
          GreatHousesLoadingView(width: elementWidth)
            .navigationTitle(viewModel.viewTitle)
        }
      }
    }
  }

  init(viewModel: GreatHousesViewModel = GreatHousesViewModel()) {
    self.viewModel = viewModel
  }
}

#if !TESTING
struct GreatHousesView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesView()
  }
}
#endif
