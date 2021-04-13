//
//  Houses_of_WesterosUITests.swift
//  Houses of WesterosUITests
//
//  Created by Matthias Zarzecki on 13.04.21.
//

import XCTest

class HousesOfWesterosUITests: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
