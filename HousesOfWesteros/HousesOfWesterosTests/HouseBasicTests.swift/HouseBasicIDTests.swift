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
    let house: HouseBasic = .mockHouseBasicWithLinksAndWithCoatOfArms

    // WHEN we check the id
    let result = house.id

    // THEN the result is an integer
    XCTAssertNotNil(result)

    if let unwrappedResult = result {
      // AND that it is part of the url
      XCTAssertTrue(house.url.contains("\(unwrappedResult)"))
    }
  }

  func testHouseBasicWithNoID() {
    // GIVEN a house that does not have a proper url
    let house: HouseBasic = .mockHouseBasicWithNoData

    // WHEN we check the id
    let result = house.id

    // THEN the result is nil
    XCTAssertNil(result)
  }
}
