//
//  StringIsLinkTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.04.21.
//

import XCTest
@testable import HousesOfWesteros

class StringIsLinkTests: XCTestCase {
  func testIsLink() {
    // GIVEN a string that is a hyperlink
    let string = "https://www.anapioficeandfire.com/api/characters/290"

    // WHEN we check if that is indeed a
    // link to access further data
    let result = string.isLink

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testIsNotLink() {
    // GIVEN a string that is not a hyperlink
    let string = "House Allyrion of Godsgrace"

    // WHEN we check if that is indeed a
    // link to access further data
    let result = string.isLink

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
