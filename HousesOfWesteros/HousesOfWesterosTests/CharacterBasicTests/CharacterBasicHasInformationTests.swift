//
//  CharacterBasicHasInformationTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 20.05.21.
//

import XCTest
@testable import HousesOfWesteros

class CharacterBasicHasInformationTests: XCTestCase {
  func testHasInformation() {
    // GIVEN a character that has some showable information
    let character: CharacterBasic = .mockCharacter

    // WHEN we call the "hasInformation" variable
    let result = character.hasInformation

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testHasNoInformation() {
    // GIVEN a character that has no showable information
    let character: CharacterBasic = .mockCharacterWithNoData

    // WHEN we call the "hasInformation" variable
    let result = character.hasInformation

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
