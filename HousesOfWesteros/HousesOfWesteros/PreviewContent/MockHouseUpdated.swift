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
    currentLord: .mockCharacter,
    heir: .mockCharacter,
    overlord: .houseBasicWithLinksAndWithCoatOfArms,
    founder: .mockCharacter,
    cadetBranches: .housesBasic,
    swornMembers: .mockCharacters
  )

  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: .houseBasicWithoutLinksAndWithCoatOfArms
  )
}
