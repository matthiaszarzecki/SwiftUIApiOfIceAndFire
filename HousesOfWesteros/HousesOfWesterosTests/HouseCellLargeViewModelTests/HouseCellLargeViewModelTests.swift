//
//  HouseCellLargeViewModelTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.03.22.
//

import SwiftUI
import XCTest
@testable import HousesOfWesteros

class HouseCellLargeViewModelTests: XCTestCase {
  func testBackgroundColorWithMajorHouse() {
    // GIVEN a major house
    let viewModel = HouseCellLargeViewModel(.mockHouseBasicWithLinksAndWithCoatOfArms)

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color matches the color gotten with that id
    XCTAssertEqual(result, Color(hex: "A8C0DC"))
  }

  func testBackgroundColorWithRegularHouse() {
    // GIVEN a regular house
    let viewModel = HouseCellLargeViewModel(.mockHouseBasicWithOnlyUrl)

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color is white
    XCTAssertEqual(result, .white)
  }

  func testBackgroundColorWithFaultyId() {
    // GIVEN a house without a valid id
    let viewModel = HouseCellLargeViewModel(.mockHouseBasicWithNoData)

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color is white
    XCTAssertEqual(result, .white)
  }
}
