//
//  StringIdTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 25.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringIdTests: XCTestCase {
  func testStringId() {
    // GIVEN a string
    let string = "Lorem"

    // WHEN we call the "id" variable
    let result = string.id

    // THEN the same string is returned
    XCTAssertEqual(result, string)
  }

  func testStringIdOnEmptyString() {
    // GIVEN an empty string
    let string = ""

    // WHEN we call the "id" variable
    let result = string.id

    // THEN the same string is returned
    XCTAssertEqual(result, string)
  }
}
