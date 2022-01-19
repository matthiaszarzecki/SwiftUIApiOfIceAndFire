//
//  StringArrayhasAtLeastOneItemTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringArrayHasAtLeastOneItemFromArrayTests: XCTestCase {
  func testStringArrayHasAtLeastOneItemFromArray() {
    // GIVEN two string-arrays with one entry appearing in both
    let array1 = ["hello", "lorem"]
    let array2 = ["bye", "lorem"]

    // WHEN we call the "hasAtLeastOneItem" function
    let result = array1.hasAtLeastOneItem(fromArray: array2)

    // THEN true is returned
    XCTAssertTrue(result)
  }

  func testStringArrayDoesNotHaveAtLeastOneItemFromArray() {
    // GIVEN two string-arrays with no entries appearing in both
    let array1 = ["hello"]
    let array2 = ["bye"]

    // WHEN we call the "hasAtLeastOneItem" function
    let result = array1.hasAtLeastOneItem(fromArray: array2)

    // THEN false is returned
    XCTAssertFalse(result)
  }

  func testEmptyStringArrayDoesNotHaveAtLeastOneItemFromArray() {
    // GIVEN two empty string-arrays
    let array1 = [String]()
    let array2 = [String]()

    // WHEN we call the "hasAtLeastOneItem" function
    let result = array1.hasAtLeastOneItem(fromArray: array2)

    // THEN false is returned
    XCTAssertFalse(result)
  }
}
