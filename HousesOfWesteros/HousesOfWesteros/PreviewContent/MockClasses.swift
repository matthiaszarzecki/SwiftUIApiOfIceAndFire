//
//  MockClasses.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

enum MockClasses {
  static let idGreatHouse = 17

  static let characterLink = "https://www.anapioficeandfire.com/api/characters/298"
  static let houseLink = "https://www.anapioficeandfire.com/api/houses/285"

  static let houseName = "House Goodbrother of Crow Spike Keep"
  static let houseRegion = "Dorne"
  static let coatOfArms = "A Gold Dove on a Green Field"
  static let motto = "No Foe May Pass"
  static let titles = [
    "King of Mountain and Vale (formerly)",
    "Lord of the Eyrie",
    "Defender of the Vale",
    "Warden of the East"
  ]
  static let seats = [
    "Godsgrace",
    "Gates of the Moon (winter)"
  ]
  static let foundingPeriod = "Coming of the Andals"
  static let diedOutPeriod = "260 AC"
  static let ancestralWeapons = ["Blackfyre", "Whitefyre"]

  static let character = CharacterBasic(
    url: "https://www.anapioficeandfire.com/api/characters/290",
    name: "Delonne Allyrion",
    culture: "Northmen",
    born: "In 283 AC",
    died: "In 372 AC",
    titles: ["Lord Commander of the Night's Watch"],
    aliases: [
      "Lord Snow",
      "Ned Stark's Bastard",
      "The Snow of Winterfell",
      "The Crow-Come-Over",
      "The 998th Lord Commander of the Night's Watch"
    ],
    tvShowAppearances: [
      "Season 1",
      "Season 2",
      "Season 3",
      "Season 4",
      "Season 5",
      "Season 6"
    ],
    portrayedBy: ["Kit Harington"],
    father: "https://www.anapioficeandfire.com/api/characters/836",
    mother: "https://www.anapioficeandfire.com/api/characters/112",
    spouse: "https://www.anapioficeandfire.com/api/characters/66",
    allegiances: ["https://anapioficeandfire.com/api/houses/362"],
    bookAppearances: ["https://anapioficeandfire.com/api/books/5"],
    hasPointOfViewChaptersInBooks: [
      "https://anapioficeandfire.com/api/books/1",
      "https://anapioficeandfire.com/api/books/2",
      "https://anapioficeandfire.com/api/books/3",
      "https://anapioficeandfire.com/api/books/8"
    ]
  )

  static let characterWithNoData = CharacterBasic(
    url: "https://www.anapioficeandfire.com/api/characters/290",
    name: "",
    culture: "",
    born: "",
    died: "",
    titles: [],
    aliases: [],
    tvShowAppearances: [],
    portrayedBy: [],
    father: "",
    mother: "",
    spouse: "",
    allegiances: [],
    bookAppearances: [],
    hasPointOfViewChaptersInBooks: []
  )

  static let characterWithNoNameButAlias = CharacterBasic(
    url: "https://www.anapioficeandfire.com/api/characters/290",
    name: "",
    culture: "",
    born: "",
    died: "",
    titles: [],
    aliases: ["The Knight"],
    tvShowAppearances: [],
    portrayedBy: [],
    father: "",
    mother: "",
    spouse: "",
    allegiances: [],
    bookAppearances: [],
    hasPointOfViewChaptersInBooks: []
  )

  static let characters = Array(repeating: character, count: 3)
}
