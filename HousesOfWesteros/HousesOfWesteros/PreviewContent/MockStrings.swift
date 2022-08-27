//
//  MockStrings.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 27.08.22.
//

import Foundation

extension String {
  static let mockCharacterLink = "https://www.anapioficeandfire.com/api/characters/298"
  static let mockHouseLink = "https://www.anapioficeandfire.com/api/houses/285"
  static let mockHouseName = "House Goodbrother of Crow Spike Keep"
  static let mockHouseRegion = "Dorne"
  static let mockCoatOfArms = "A Gold Dove on a Green Field"
  static let mockMotto = "No Foe May Pass"
  static let mockFoundingPeriod = "Coming of the Andals"
  static let mockDiedOutPeriod = "260 AC"
}

extension Array where Element == String {
  static let mockTitles = [
    "King of Mountain and Vale (formerly)",
    "Lord of the Eyrie",
    "Defender of the Vale",
    "Warden of the East"
  ]

  static let mockSeats = [
    "Godsgrace",
    "Gates of the Moon (winter)"
  ]

  static let mockAncestralWeapons = [
    "Blackfyre",
    "Whitefyre"
  ]
}
