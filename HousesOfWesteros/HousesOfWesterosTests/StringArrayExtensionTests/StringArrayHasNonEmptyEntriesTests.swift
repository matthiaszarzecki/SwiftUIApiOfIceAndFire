//
//  StringArrayHasNonEmptyEntriesTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringArrayHasNonEmptyEntriesTests: XCTestCase {
  func testStringArrayHasNonEmptyEntries() {
    // GIVEN a string-array with multiple entries
    let array = ["lorem", "ipsum"]

    // WHEN we call the "hasNonEmptyEntries" function
    let result = array.hasNonEmptyEntries

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testStringArrayHasEmptyEntries() {
    // GIVEN a string-array with empty strings
    let array = ["", ""]

    // WHEN we call the "hasNonEmptyEntries" function
    let result = array.hasNonEmptyEntries

    // THEN false is returned
    XCTAssertFalse(result)
  }

  func testEmptyStringArrayHasNonEmptyEntries() {
    // GIVEN an empty string-array
    let array: [String] = []

    // WHEN we call the "hasNonEmptyEntries" function
    let result = array.hasNonEmptyEntries

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
