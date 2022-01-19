//
//  StringExtensionTests.swift
//  GotTestTests
//
//  Created by Matthias Zarzecki on 25.01.21.
//

import XCTest
@testable import HousesOfWesteros

class StringFirstTests: XCTestCase {
  func testFirst() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we call the "first" computed variable
    let result = character.first

    // THEN the first character is returned
    XCTAssertEqual(result, "D")
  }

  func testFirstOnEmptyString() {
    // GIVEN an empty string
    let character = ""

    // WHEN we call the "first" computed variable
    let result = character.first

    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
}
