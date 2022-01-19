//
//  StringArrayHasLinkEntries.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringArrayHasLinkEntriesTests: XCTestCase {
  func testStringArrayHasLinkEntries() {
    // GIVEN a string-array that contains a link
    let array = ["https://www.google.com"]

    // WHEN we call the "hasLinkEntries" function
    let result = array.hasLinkEntries

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testStringArrayHasNoLinkEntries() {
    // GIVEN a string-array that does not contain a link
    let array = ["lorem", "ipsum"]

    // WHEN we call the "hasLinkEntries" function
    let result = array.hasLinkEntries

    // THEN false is returned
    XCTAssertFalse(result)
  }

  func testEmptyStringArrayHasLinkEntries() {
    // GIVEN an empty string-array
    let array = [String]()

    // WHEN we call the "hasLinkEntries" function
    let result = array.hasLinkEntries

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
