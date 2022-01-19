//
//  StringCapitalizeFirstLetterInPlaceTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringCapitalizeFirstLetterInPlaceTests: XCTestCase {
  func testStringCapitalizeFirstLetterInPlace() {
    // GIVEN a string beginning with a lowercase letter
    var string = "lorem"

    // WHEN we call the "CapitalizeFirstLetterInPlace" function
    string.capitalizeFirstLetterInPlace()

    // THEN the string's first character is capitalized
    XCTAssertEqual(string, "Lorem")
  }

  func testEmptyStringCapitalizeFirstLetterInPlace() {
    // GIVEN an empty string
    var string = ""

    // WHEN we call the "CapitalizeFirstLetterInPlace" function
    string.capitalizeFirstLetterInPlace()

    // THEN the string remains empty
    XCTAssertEqual(string, "")
  }

  func testCapitalizedStringCapitalizeFirstLetterInPlace() {
    // GIVEN a string beginning with an uppercase letter
    var string = "Lorem"

    // WHEN we call the "CapitalizeFirstLetterInPlace" function
    string.capitalizeFirstLetterInPlace()

    // THEN the string remains unchanged
    XCTAssertEqual(string, "Lorem")
  }
}
