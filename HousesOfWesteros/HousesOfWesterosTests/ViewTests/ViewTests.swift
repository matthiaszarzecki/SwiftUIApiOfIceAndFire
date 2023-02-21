//
//  ViewTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.02.23.
//

import XCTest
@testable import HousesOfWesteros

class ViewTests: XCTestCase {
  func testAllHousesView() {
    let configurations: [AllHousesViewModel] = [
      .mockViewModelLoading,
      .mockViewModelError,
      .mockViewModelRegularAndLoadingMore,
      .mockViewModelRegularAndNotLoadingMore
    ]

    for index in 0..<configurations.count {
      _ = AllHousesView(viewModel: configurations[index])
    }
  }

  func testGreatHousesView() {
    let configurations: [[HouseBasic]] = [
      .mockHousesBasic,
      .mockHousesEmptyArray
    ]

    for index in 0..<configurations.count {
      _ = GreatHousesDisplay(
        houses: configurations[index],
        hasViableEntries: true,
        viewTitle: "Great Houses of Westeros"
      )
    }
  }

  func testCharacterView() {
    _ = CharacterView(character: .mockCharacter)
  }
}
