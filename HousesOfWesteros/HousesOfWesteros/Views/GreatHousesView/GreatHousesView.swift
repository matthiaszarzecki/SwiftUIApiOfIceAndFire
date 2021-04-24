//
//  GreatHousesView.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 24.04.21.
//

import SwiftUI

class GreatHousesViewModel: ObservableObject {
  @Published private(set) var state = GreatHousesViewState()
  
  init() {
    for id in Constants.greatHouses {
      Api.getSingleHouse(id: id) { result in
        switch result {
        case .success(let receivedObject):
          print("")
          // Add house to local collection
          //self.state.showError = false
        case .failure(let error):
          print("Error! \(error)")
          //self.state.showError = true
        }
      }
    }
  }
  
  struct GreatHousesViewState {
    var houses = [HouseBasic]()
  }
}

struct GreatHousesView: View {
  @ObservedObject private var greatHousesViewModel = GreatHousesViewModel()
  
  var body: some View {
    GreatHousesDisplay(
      houses: greatHousesViewModel.state.houses
    )
  }
}

struct GreatHousesDisplay: View {
  var houses: [HouseBasic]
  
  var body: some View {
    Text("Hello, World!")
  }
}

struct GreatHousesView_Previews: PreviewProvider {
  static var previews: some View {
    GreatHousesDisplay(
      houses: MockClasses.housesBasic
    )
  }
}
