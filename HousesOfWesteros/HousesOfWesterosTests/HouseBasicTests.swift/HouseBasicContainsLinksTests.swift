//
//  GotTestTests.swift
//  GotTestTests
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import XCTest
@testable import HousesOfWesteros

class HouseBasicContainsLinksTests: XCTestCase {
  func testHouseWithLinksContainsLinks() {
    // GIVEN a house that contains at least one link
    let house: HouseBasic = .mockHouseBasicWithLinksAndWithCoatOfArms

    // WHEN we check if it contains links at all
    let result = house.containsLinks

    // THEN we receive a positive result
    XCTAssertTrue(result)
  }

  func testHouseWithoutLinksShowsContainsNoLinks() {
    // GIVEN a house that contains no links
    let house: HouseBasic = .mockHouseWithoutLinksAndWithCoatOfArms

    // WHEN we check if it contains links at all
    let result = house.containsLinks

    // THEN we receive a negative result
    XCTAssertFalse(result)
  }
}
