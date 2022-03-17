//
//  MockHouseUpdated.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

extension HouseUpdated {
  static let houseUpdatedWithLinks = HouseUpdated(
    fromHouse: .houseBasicWithLinksAndWithCoatOfArms,
    currentLord: .character,
    heir: .character,
    overlord: .houseBasicWithLinksAndWithCoatOfArms,
    founder: .character,
    cadetBranches: .housesBasic,
    swornMembers: .characters
  )

  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: .houseBasicWithoutLinksAndWithCoatOfArms
  )
}
