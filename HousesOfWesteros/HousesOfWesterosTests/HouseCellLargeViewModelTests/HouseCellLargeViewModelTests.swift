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
    let viewModel = HouseCellLargeViewModel(
      .mockHouseBasicWithLinksAndWithCoatOfArms
    )

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color matches the color gotten with that id
    XCTAssertEqual(result, Color(hex: "A8C0DC"))
  }

  func testBackgroundColorWithRegularHouse() {
    // GIVEN a regular house
    let viewModel = HouseCellLargeViewModel(
      .mockHouseWithoutLinksAndWithCoatOfArms
    )

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color is white
    XCTAssertEqual(result, .white)
  }

  func testBackgroundColorWithFaultyId() {
    // GIVEN a house without a valid id
    let viewModel = HouseCellLargeViewModel(
      .mockHouseBasicWithNoData
    )

    // WHEN we call the backgroundColor variable
    let result = viewModel.backgroundColor

    // THEN the color is white
    XCTAssertEqual(result, .white)
  }

  func testGreatHouseIdWithGreatHouse() {
    // GIVEN a major house
    let viewModel = HouseCellLargeViewModel(
      .mockHouseBasicWithLinksAndWithCoatOfArms
    )

    // WHEN we call the greatHouseId variable
    let result = viewModel.greatHouseId

    // THEN the result is the id
    XCTAssertEqual(result, HouseBasic.mockHouseBasicWithLinksAndWithCoatOfArms.id)
  }

  func testGreatHouseIdWithRegularHouse() {
    // GIVEN a regular house
    let viewModel = HouseCellLargeViewModel(
      .mockHouseWithoutLinksAndWithCoatOfArms
    )

    // WHEN we call the greatHouseId variable
    let result = viewModel.greatHouseId

    // THEN the result is nil
    XCTAssertNil(result)
  }

  func testSubtitleNoMembers() {
    // GIVEN a house with no members
    let viewModel = HouseCellLargeViewModel(
      .mockHouseWithoutLinksAndWithCoatOfArms
    )

    // WHEN we call the susbtitle variable
    let result = viewModel.subtitle

    // THEN the result is "Members: 0"
    XCTAssertEqual(result, "Members: 0")
  }

  func testSubtitleWithMembersAndBranches() {
    // GIVEN a house with members and branches
    let viewModel = HouseCellLargeViewModel(
      .mockHouseWithLinksAndWithoutCoatOfArms
    )

    // WHEN we call the susbtitle variable
    let result = viewModel.subtitle

    // THEN the result is "Members: 4 - Branches: 2"
    XCTAssertEqual(result, "Members: 4 - Branches: 2")
  }
}
