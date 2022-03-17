//
//  MockCharacterBasic.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

extension CharacterBasic {
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
}

extension Array where Element == CharacterBasic {
  static let characters: [CharacterBasic] = Array(repeating: .character, count: 3)
}
