//
//  ColorGreatHousesMajorColorTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 25.05.21.
//

import SwiftUI
import XCTest
@testable import HousesOfWesteros

class ColorGreatHousesMajorColorTests: XCTestCase {
  func testGettingAColorOfAGreatHouse() {
    // GIVEN a house that is a Great House
    let house: HouseBasic = .mockHouseBasicWithLinksAndWithCoatOfArms

    // WHEN we access a the associated GreatHouseMajorColor
    let invalidHouseId = -1
    let result = Color.greatHousesMajorColor(id: house.id ?? invalidHouseId)

    // THEN we receive a color that is not .white
    XCTAssertNotEqual(result, .white)
  }

  func testNotGettingAColorOfAGreatHouse() {
    // GIVEN a house that is not a Great House
    let house: HouseBasic = .mockHouseBasicWithOnlyUrl

    // WHEN we access a the associated GreatHouseMajorColor
    let invalidHouseId = -1
    let result = Color.greatHousesMajorColor(id: house.id ?? invalidHouseId)

    // THEN we receive the fallback-color, which is .white
    XCTAssertEqual(result, .white)
  }
}
