//
//  ErrorDisplayViewModelTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 06.09.22.
//

import XCTest
@testable import HousesOfWesteros

class ErrorDisplayViewModelTests: XCTestCase {
  func testErrorViewModel() {
    // GIVEN two string-arrays with one entry appearing in both
    let viewModel: ErrorDisplayViewModel = .mockErrorDisplayViewModel

    // WHEN we call the "hasAtLeastOneItem" function
    let result = viewModel.textTitle

    // THEN true is returned
    XCTAssertNotEqual(result, "")
  }
}
