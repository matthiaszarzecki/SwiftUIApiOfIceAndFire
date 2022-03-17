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
    currentLord: MockClasses.character,
    heir: MockClasses.character,
    overlord: .houseBasicWithLinksAndWithCoatOfArms,
    founder: MockClasses.character,
    cadetBranches: .housesBasic,
    swornMembers: MockClasses.characters
  )

  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: .houseBasicWithoutLinksAndWithCoatOfArms
  )
}
