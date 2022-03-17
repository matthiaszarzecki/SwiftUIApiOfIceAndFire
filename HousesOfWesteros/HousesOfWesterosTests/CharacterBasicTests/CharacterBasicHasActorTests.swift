//
//  CharacterBasicHasActorTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 20.05.21.
//

import XCTest
@testable import HousesOfWesteros

class CharacterBasicHasActorTests: XCTestCase {
  func testHasActor() {
    // GIVEN a character that has an actor
    let character: CharacterBasic = .character

    // WHEN we call the "hasActor" function
    let result = character.hasActor

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testHasNoActor() {
    // GIVEN a character that has no actor
    let character: CharacterBasic = .characterWithNoData

    // WHEN we call the "hasActor" function
    let result = character.hasActor

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
