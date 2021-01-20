//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct SingleHouseView: View {
  @ObservedObject private var viewModel: SingleHouseViewModel
  
  init(houseBasic: HouseBasic) {
    viewModel = SingleHouseViewModel(houseBasic: houseBasic)
  }
  
  var body: some View {
    SingleHouseDisplay(houseUpdated: viewModel.state.houseUpdated)
  }
}

struct SingleHouseDisplay: View {
  let houseUpdated: HouseUpdated?
  
  var body: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        GeometryReader { geometry in
          ScrollView(showsIndicators: false) {
            Group {
              Title(house: unwrappedHouseUpdated)
              CoatOfArms(house: unwrappedHouseUpdated)
              HouseMotto(house: unwrappedHouseUpdated)
              Titles(house: unwrappedHouseUpdated)
              Seats(house: unwrappedHouseUpdated)
              CurrentLord(house: unwrappedHouseUpdated)
              Heir(house: unwrappedHouseUpdated)
            }
            Group {
              Overlord(house: unwrappedHouseUpdated)
              Founded(house: unwrappedHouseUpdated)
              Founder(house: unwrappedHouseUpdated)
              DiedOut(house: unwrappedHouseUpdated)
              AncestralWeapons(house: unwrappedHouseUpdated)
              CadetBranches(house: unwrappedHouseUpdated)
              SwornMembers(house: unwrappedHouseUpdated)
            }
          }
          .frame(width: geometry.size.width, alignment: .center)
        }
      )
    } else {
      return AnyView(Text("Loading"))
    }
  }
}

struct SingleHouseDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SingleHouseDisplay(houseUpdated: MockClasses.houseUpdated)
      SingleHouseDisplay(houseUpdated: nil)
    }
  }
}
