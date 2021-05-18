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
  func testHexInitRedWithHashSign() {
    // GIVEN a hex-string that encodes "red" beginning with a hashsign
    let hex = "#FF0000"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
  
  func testHexInitRedWithoutHashSign() {
    // GIVEN a hex-string that encodes "red" without a hashsign
    let hex = "FF0000"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
  
  func testHexFromThreeCharacters() {
    // GIVEN a hex-string that encodes "green" without a hashsign
    let hex = "0F0"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 0.0, green: 1.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
  
  func testHexWithAlpha() {
    // GIVEN a hex-string that encodes "red" without a hashsign
    let hex = "FFFF0000"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
  
  func testInvalidInput() {
    // GIVEN a hex-string that encodes "red" without a hashsign
    let hex = "FFFF"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
}
