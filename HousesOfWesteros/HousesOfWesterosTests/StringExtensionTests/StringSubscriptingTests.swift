//
//  StringSubscriptingTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.04.21.
//

import XCTest
@testable import HousesOfWesteros

class StringSubscriptingTests: XCTestCase {
  func testSubScriptingAStringWithIndexZero() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it to access the first character
    let result = character[0]

    // THEN the respective character is returned
    XCTAssertEqual(result, "D")
  }

  func testSubScriptingAStringWithAMiddleIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it to access a character
    // in the middle of the string
    let result = character[3]

    // THEN the respective character is returned
    XCTAssertEqual(result, "o")
  }

  func testSubScriptingAStringWithMaxIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it to access the
    // character at the last index
    let result = character[15]

    // THEN the respective character is returned
    XCTAssertEqual(result, "n")
  }

  func testSubScriptingAStringWithMaxIndexPlusOne() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it to access a
    // character with an index 1 higher
    // than the last index
    let result = character[16]

    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }

  func testSubScriptingAStringWithIndexOutOfBounds() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it with an index
    // that is longer than the string
    let result = character[99]

    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }

  func testSubScriptingAnEmptyString() {
    // GIVEN an empty string
    let character = ""

    // WHEN we subscript it to access a character
    let result = character[3]

    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }

  func testSubScriptingAStringWithANegativeIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"

    // WHEN we subscript it with a negative index
    let result = character[-1]

    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
}
