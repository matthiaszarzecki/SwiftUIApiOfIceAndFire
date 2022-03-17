//
//  CharacterBasicInitialLetterTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.05.21.
//

import XCTest
@testable import HousesOfWesteros

class CharacterBasicInitialLetterTests: XCTestCase {
  func testInitialLetter() {
    // GIVEN a character that has a name
    let character: CharacterBasic = .mockCharacter

    // WHEN we call the "initialLetter" variable
    let result = character.initialLetter

    // THEN the first letter of that name is returned.
    XCTAssertEqual("D", result)
  }
}
