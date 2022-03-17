//
//  MockHousesBasic.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

/// Mock Houses
extension HouseBasic {
  static let houseBasicWithLinksAndWithCoatOfArms = HouseBasic(
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

  static let houseBasicWithLinksAndWithoutCoatOfArms = HouseBasic(
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

  static let houseBasicWithoutLinksAndWithCoatOfArms = HouseBasic(
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

  static let houseBasicWithoutLinksWithoutCoatOfArms = HouseBasic(
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

  static let houseWithOnlyUrl = HouseBasic(
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

  static let houseWithNoData = HouseBasic(
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
  static let housesBasic: [HouseBasic] = [
    .houseBasicWithLinksAndWithCoatOfArms,
    .houseBasicWithLinksAndWithoutCoatOfArms,
    .houseBasicWithoutLinksAndWithCoatOfArms,
    .houseBasicWithoutLinksWithoutCoatOfArms
  ]
}
