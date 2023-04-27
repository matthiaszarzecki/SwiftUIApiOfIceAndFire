//
//  BaseView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct BaseView: View {
  private let viewModel: BaseViewViewModel

  @State private var selection: Int = .zero

  var body: some View {
    TabView {
      GreatHousesView()
        .tabItem {
          Label(
            viewModel.textGreatHouses,
            systemImage: "shield.checkerboard"
          )
        }
        .tag(0)

      AllHousesView(viewModel: AllHousesViewModel())
        .tabItem {
          Label(
            viewModel.textAllHouses,
            systemImage: "shield.lefthalf.fill"
          )
        }
        .tag(1)

      AboutView()
        .tabItem {
          Label(
            viewModel.textAbout,
            systemImage: "gear"
          )
        }
        .tag(2)
    }
    .accentColor(.westerosRed)
  }

  init(viewModel: BaseViewViewModel = BaseViewViewModel()) {
    self.viewModel = viewModel

    viewModel.customizeNavigationBar()
  }
}

#if !TESTING
struct BaseView_Previews: PreviewProvider {
  static var previews: some View {
    BaseView()
  }
}
#endif
