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
    // GIVEN a house that contains at least one link
    let house = MockClasses.houseBasicWithLinks
    
    // WHEN we check if it contains links at all
    let result = house.cointainsLinks
    
    // THEN we receive a positive result
    XCTAssertTrue(result)
  }
  
  func testHouseWithoutLinksShowsIfLinksAreMissing() {
    // GIVEN a house that contains no links
    let house = MockClasses.houseBasicWithoutLinks
    
    // WHEN we check if it contains links at all
    let result = house.cointainsLinks
    
    // THEN we receive a negative result
    XCTAssertFalse(result)
  }
}
