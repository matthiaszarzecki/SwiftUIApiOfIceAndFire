//
//  GreatHousesViewModelTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 09.07.21.
//

import Foundation
import XCTest
@testable import HousesOfWesteros

class GreatHousesLoadAllGreatHousesTests: XCTestCase {
  func testLoadAllGreatHousesCount() {
    // GIVEN a GreatHousesViewModel
    let viewModel = GreatHousesViewModel(downloader: MockSingleHouseBasicDownloader())

    // WHEN we load all great houses
    viewModel.loadAllGreatHouses()

    // THEN the amount of entries gotten is the same
    // as the number of great houses specified.
    XCTAssertEqual(viewModel.state.houses.count, Constants.greatHouses.count)

    // AND every entry is not nil
    for entry in viewModel.state.houses {
      XCTAssertNotNil(entry)
    }
  }
}
