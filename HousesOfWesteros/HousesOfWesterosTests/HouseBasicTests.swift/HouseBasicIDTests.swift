//
//  HouseBasicIDTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 25.05.21.
//

import XCTest
@testable import HousesOfWesteros

class HouseBasicIDTests: XCTestCase {
  func testHouseBasicID() {
    // GIVEN a house that has a proper url
    let house = MockClasses.houseBasicWithLinksAndWithCoatOfArms

    // WHEN we check the id
    let result = house.id

    // THEN the result is an integer
    XCTAssertNotNil(result)
    // AND that it is part of the url
    XCTAssertTrue(house.url.contains("\(result!)"))
  }

  func testHouseBasicWithNoID() {
    // GIVEN a house that does not have a proper url
    let house = MockClasses.houseWithNoData

    // WHEN we check the id
    let result = house.id

    // THEN the result is nil
    XCTAssertNil(result)
  }
}
