//
//  HouseBasicHeraldryColorsTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 28.05.21.
//

import SwiftUI
import XCTest
@testable import HousesOfWesteros

class HouseBasicHeraldryColorsTests: XCTestCase {
  func testGetHeraldryColors() {
    // GIVEN a house with a sigil-description
    let house = MockClasses.houseBasicWithLinksAndWithCoatOfArms

    // WHEN we call the heraldryColors variable
    let result = house.heraldryColors

    // THEN we receive an array with the corresponding colors.
    XCTAssertEqual([.yellow, .green], result)
  }

  func testGetNoHeraldryColors() {
    // GIVEN a house with a sigil-description
    let house = MockClasses.houseBasicWithoutLinksWithoutCoatOfArms

    // WHEN we call the heraldryColors variable
    let result = house.heraldryColors

    // THEN we receive an empty array.
    XCTAssertEqual([], result)
  }
}
