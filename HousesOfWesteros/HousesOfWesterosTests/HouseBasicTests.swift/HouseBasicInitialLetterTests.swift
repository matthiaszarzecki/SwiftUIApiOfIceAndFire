//
//  HouseBasicInitialLetterTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.05.21.
//

import XCTest
@testable import HousesOfWesteros

class HouseBasicInitialLetterTests: XCTestCase {
  func testHouseInitialLetter() {
    // GIVEN a house that contains at least one link
    let house: HouseBasic = .houseBasicWithLinksAndWithCoatOfArms

    // WHEN we check if it contains links at all
    let result = house.initialLetter

    // THEN we receive a positive result
    XCTAssertEqual("G", result)
  }

  func testHouseInitialLetterFromHouseWithNoData() {
    // GIVEN a house that contains at least one link
    let house: HouseBasic = .houseWithOnlyUrl

    // WHEN we check if it contains links at all
    let result = house.initialLetter

    // THEN we receive a positive result
    XCTAssertEqual("", result)
  }
}
