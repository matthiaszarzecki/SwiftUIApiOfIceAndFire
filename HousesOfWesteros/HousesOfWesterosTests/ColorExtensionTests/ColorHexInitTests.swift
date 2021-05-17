//
//  ColorHexInitTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 18.05.21.
//

import SwiftUI
import XCTest
@testable import HousesOfWesteros

class ColorHexInitTests: XCTestCase {
  func testHexInitRed() {
    // GIVEN a hex-string that encodes "red"
    let hex = "#FF0000"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)
    
    // THEN the resulting SwiftUI Color is Color.red
    XCTAssertEqual(.red, result)
  }
}
