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

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 0, blue: 0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
}
