//
//  GotTestTests.swift
//  GotTestTests
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import XCTest
@testable import GotTest

class HouseBasicTests: XCTestCase {
  
  func testHouseWithLinksShowsIfLinksArePresent() {
    let house = MockClasses.houseBasicWithLinks
    XCTAssertTrue(house.cointainsLinks)
  }
  
  func testHouseWithoutLinksShowsIfLinksAreMissing() {
    let house = MockClasses.houseBasicWithoutLinks
    XCTAssertFalse(house.cointainsLinks)
  }
}
