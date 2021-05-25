//
//  HouseBasicIsGreatHouseTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 25.05.21.
//

import XCTest
@testable import HousesOfWesteros

class HouseBasicIsGreatHouseTests: XCTestCase {
  func testHouseIsGreatHouse() {
    // GIVEN a house that is a Great House
    let house = MockClasses.houseBasicWithLinksAndWithCoatOfArms

    // WHEN we check the "isGreatHouse" variable
    let result = house.isGreatHouse

    // THEN we receive a positive result
    XCTAssertTrue(result)
  }

  func testHouseIsNotGreatHouse() {
    // GIVEN a house that is not a Great House
    let house = MockClasses.houseWithNoData

    // WHEN we check the "isGreatHouse" variable
    let result = house.isGreatHouse

    // THEN we receive a negative result
    XCTAssertFalse(result)
  }
}
