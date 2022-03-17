//
//  MockHouseUpdated.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

extension HouseUpdated {
  static let houseUpdatedWithLinks = HouseUpdated(
    fromHouse: .mockHouseBasicWithLinksAndWithCoatOfArms,
    currentLord: .mockCharacter,
    heir: .mockCharacter,
    overlord: .mockHouseBasicWithLinksAndWithCoatOfArms,
    founder: .mockCharacter,
    cadetBranches: .mockHousesBasic,
    swornMembers: .mockCharacters
  )

  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: .mockHouseBasicWithoutLinksAndWithCoatOfArms
  )
}
