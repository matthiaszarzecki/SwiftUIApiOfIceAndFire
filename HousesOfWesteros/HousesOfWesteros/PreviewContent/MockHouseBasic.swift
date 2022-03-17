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
    name: MockClasses.houseName,
    region: MockClasses.houseRegion,
    coatOfArms: MockClasses.coatOfArms,
    motto: MockClasses.motto,
    titles: MockClasses.titles,
    seats: MockClasses.seats,
    foundingPeriod: MockClasses.foundingPeriod,
    diedOutPeriod: MockClasses.diedOutPeriod,
    ancestralWeapons: MockClasses.ancestralWeapons,
    currentLord: MockClasses.characterLink,
    heir: MockClasses.characterLink,
    overlordHouse: MockClasses.houseLink,
    foundedByCharacter: MockClasses.characterLink,
    cadetBranches: Array(repeating: MockClasses.houseLink, count: 2),
    swornMembers: Array(repeating: MockClasses.characterLink, count: 4)
  )

  /// A great house
  static let mockHouseWithLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/17",
    name: MockClasses.houseName,
    region: MockClasses.houseRegion,
    coatOfArms: "",
    motto: MockClasses.motto,
    titles: MockClasses.titles,
    seats: MockClasses.seats,
    foundingPeriod: MockClasses.foundingPeriod,
    diedOutPeriod: MockClasses.diedOutPeriod,
    ancestralWeapons: MockClasses.ancestralWeapons,
    currentLord: MockClasses.characterLink,
    heir: MockClasses.characterLink,
    overlordHouse: MockClasses.houseLink,
    foundedByCharacter: MockClasses.characterLink,
    cadetBranches: Array(repeating: MockClasses.houseLink, count: 2),
    swornMembers: Array(repeating: MockClasses.characterLink, count: 4)
  )

  /// A Regular (non-major) House
  static let mockHouseWithoutLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/292",
    name: MockClasses.houseName,
    region: MockClasses.houseRegion,
    coatOfArms: MockClasses.coatOfArms,
    motto: MockClasses.motto,
    titles: MockClasses.titles,
    seats: MockClasses.seats,
    foundingPeriod: MockClasses.foundingPeriod,
    diedOutPeriod: MockClasses.diedOutPeriod,
    ancestralWeapons: MockClasses.ancestralWeapons,
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
    name: MockClasses.houseName,
    region: MockClasses.houseRegion,
    coatOfArms: "",
    motto: MockClasses.motto,
    titles: MockClasses.titles,
    seats: MockClasses.seats,
    foundingPeriod: MockClasses.foundingPeriod,
    diedOutPeriod: MockClasses.diedOutPeriod,
    ancestralWeapons: MockClasses.ancestralWeapons,
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
}
