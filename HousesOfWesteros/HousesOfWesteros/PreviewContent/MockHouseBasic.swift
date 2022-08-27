//
//  MockHousesBasic.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

/// Mock Houses
extension HouseBasic {
  /// A Great house
  static let mockHouseBasicWithLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/7",
    name: .mockHouseName,
    region: .mockHouseRegion,
    coatOfArms: .mockCoatOfArms,
    motto: .mockMotto,
    titles: .mockTitles,
    seats: .mockSeats,
    foundingPeriod: .mockFoundingPeriod,
    diedOutPeriod: .mockDiedOutPeriod,
    ancestralWeapons: .mockAncestralWeapons,
    currentLord: .mockCharacterLink,
    heir: .mockCharacterLink,
    overlordHouse: .mockHouseLink,
    foundedByCharacter: .mockCharacterLink,
    cadetBranches: Array(repeating: .mockHouseLink, count: 2),
    swornMembers: Array(repeating: .mockCharacterLink, count: 4)
  )

  /// A great house
  static let mockHouseWithLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/17",
    name: .mockHouseName,
    region: .mockHouseRegion,
    coatOfArms: "",
    motto: .mockMotto,
    titles: .mockTitles,
    seats: .mockSeats,
    foundingPeriod: .mockFoundingPeriod,
    diedOutPeriod: .mockDiedOutPeriod,
    ancestralWeapons: .mockAncestralWeapons,
    currentLord: .mockCharacterLink,
    heir: .mockCharacterLink,
    overlordHouse: .mockHouseLink,
    foundedByCharacter: .mockCharacterLink,
    cadetBranches: Array(repeating: .mockHouseLink, count: 2),
    swornMembers: Array(repeating: .mockCharacterLink, count: 4)
  )

  /// A Regular (non-major) House
  static let mockHouseWithoutLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/292",
    name: .mockHouseName,
    region: .mockHouseRegion,
    coatOfArms: .mockCoatOfArms,
    motto: .mockMotto,
    titles: .mockTitles,
    seats: .mockSeats,
    foundingPeriod: .mockFoundingPeriod,
    diedOutPeriod: .mockDiedOutPeriod,
    ancestralWeapons: .mockAncestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )

  /// A Regular (non-major) House
  static let mockHouseWithoutLinksWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/293",
    name: .mockHouseName,
    region: .mockHouseRegion,
    coatOfArms: "",
    motto: .mockMotto,
    titles: .mockTitles,
    seats: .mockSeats,
    foundingPeriod: .mockFoundingPeriod,
    diedOutPeriod: .mockDiedOutPeriod,
    ancestralWeapons: .mockAncestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )

  /// A Regular (non-major) House
  static let mockHouseBasicWithOnlyUrl = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/113",
    name: "",
    region: "",
    coatOfArms: "",
    motto: "",
    titles: [],
    seats: [],
    foundingPeriod: "",
    diedOutPeriod: "",
    ancestralWeapons: [],
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )

  static let mockHouseBasicWithNoData = HouseBasic(
    url: "",
    name: "",
    region: "",
    coatOfArms: "",
    motto: "",
    titles: [],
    seats: [],
    foundingPeriod: "",
    diedOutPeriod: "",
    ancestralWeapons: [],
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )
}

extension Array where Element == HouseBasic {
  static let mockHousesBasic: [HouseBasic] = [
    .mockHouseBasicWithLinksAndWithCoatOfArms,
    .mockHouseWithLinksAndWithoutCoatOfArms,
    .mockHouseWithoutLinksAndWithCoatOfArms,
    .mockHouseWithoutLinksWithoutCoatOfArms
  ]

  static let mockHousesEmtpyArray: [HouseBasic] = []
}
