//
//  MockCharacterBasic.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import Foundation

extension CharacterBasic {
  static let mockCharacter = CharacterBasic(
    url: .mockCharacterLink,
    name: .mockCharacterName,
    culture: .mockCulture,
    born: .mockBorn,
    died: .mockBorn,
    titles: .mockCharacterTitles,
    aliases: .mockAliases,
    tvShowAppearances: .mockTvShowAppearances,
    portrayedBy: .mockPortrayedBy,
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

  static let mockCharacterWithNoData = CharacterBasic(
    url: .mockCharacterLink,
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

  static let mockCharacterWithNoNameButAlias = CharacterBasic(
    url: .mockCharacterLink,
    name: "",
    culture: "",
    born: "",
    died: "",
    titles: [],
    aliases: .mockAliases,
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
  static let mockCharacters: [CharacterBasic] = Array(repeating: .mockCharacter, count: 3)
}
