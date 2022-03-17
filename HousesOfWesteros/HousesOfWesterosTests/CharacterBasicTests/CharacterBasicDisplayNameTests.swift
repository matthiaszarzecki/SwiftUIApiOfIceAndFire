//
//  CharacterBasicDisplayNameTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.05.21.
//

import XCTest
@testable import HousesOfWesteros

class CharacterBasicDisplayNameTests: XCTestCase {
  func testDisplayName() {
    // GIVEN a character that has a name
    let character: CharacterBasic = .mockCharacter

    // WHEN we call the "displayName" variable
    let result = character.displayName

    // THEN the name is returned.
    XCTAssertEqual(character.name, result)
  }

  func testDisplayNameWithNoName() {
    // GIVEN a character that has a no name, but an alias
    let character: CharacterBasic = .mockCharacterWithNoNameButAlias

    // WHEN we call the "displayName" variable
    let result = character.displayName

    // THEN the alias is returned.
    XCTAssertEqual(character.aliases.first, result)
  }

  func testDisplayNameWithNoNameAndNoAlias() {
    // GIVEN a character that has a no name and no aliases
    let character: CharacterBasic = .mockCharacterWithNoData

    // WHEN we call the "displayName" variable
    let result = character.displayName

    // THEN "Unknown Name" is returned.
    XCTAssertEqual("Unknown Name", result)
  }
}
