//
//  HouseCellLargeViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation
import SwiftUI

struct HouseCellLargeViewModel {
  var house: HouseBasic

  var backgroundColor: Color {
    if let unwrappedId = house.id {
      return .greatHousesMajorColor(id: unwrappedId)
    }
    return .white
  }

  var subtitle: String {
    var text = "Members: \(house.swornMembers.count)"

    if house.cadetBranches.hasEntries {
      text += " - Branches: \(house.cadetBranches.count)"
    }

    return text
  }

  var greatHouseId: Int? {
    if
      house.id != nil,
      house.isGreatHouse
    {
      return house.id
    }
    return nil
  }

  init(_ house: HouseBasic) {
    self.house = house
  }
}
