//
//  ErrorDisplayViewModelTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 06.09.22.
//

import XCTest
@testable import HousesOfWesteros

class ErrorDisplayViewModelTests: XCTestCase {
  func testErrorViewModelTextTitle() {
    // GIVEN an error view model
    let viewModel: ErrorDisplayViewModel = .mockErrorDisplayViewModel

    // WHEN we call the "textTitle" property
    let result = viewModel.textTitle

    // THEN a non-empty string is returned
    XCTAssertNotEqual(result, "")
  }

  func testErrorViewModelTextExplanation() {
    // GIVEN an error view model
    let viewModel: ErrorDisplayViewModel = .mockErrorDisplayViewModel

    // WHEN we call the "textExplanation" property
    let result = viewModel.textExplanation

    // THEN a non-empty string is returned
    XCTAssertNotEqual(result, "")
  }
}
