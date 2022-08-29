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
  static let mockInitialLetter = "S"

  static let mockCharacterName = "Delonne Allyrion"
  static let mockCulture = "Northmen"
  static let mockBorn = "In 283 AC"
  static let mockDied = "In 372 AC"
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

  static let mockCadetBranches = Array(repeating: .mockHouseLink, count: 3)

  static let mockSwornMembers = Array(repeating: .mockCharacterLink, count: 4)

  static let mockCharacterTitles = ["Lord Commander of the Night's Watch"]

  static let mockAliases = [
    "Lord Snow",
    "Ned Stark's Bastard",
    "The Snow of Winterfell",
    "The Crow-Come-Over",
    "The 998th Lord Commander of the Night's Watch"
  ]

  static let mockTvShowAppearances = [
    "Season 1",
    "Season 2",
    "Season 3",
    "Season 4",
    "Season 5",
    "Season 6"
  ]

  static let mockPortrayedBy = ["Kit Harington"]
}
