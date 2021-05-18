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
    // GIVEN a 3-character hex-string that encodes "green"
    let hex = "0F0"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorGreen = Color(.sRGB, red: 0.0, green: 1.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorGreen)
  }
  
  func testHexWithAlpha() {
    // GIVEN an 8-character-hex-string that encodes "red"
    let hex = "FFFF0000"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the resulting SwiftUI Color is identical
    // to a regularly initialized SwiftUI Color.
    let colorRed = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)
    XCTAssertEqual(result, colorRed)
  }
  
  func testInvalidInputWithHex() {
    // GIVEN a hex-string that does not conform to
    // the supported 3, 6 or 8 input-characters
    let hex = "FFFF"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the default white color is returned.
    let colorWhite = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 1.0)
    XCTAssertEqual(result, colorWhite)
  }
  
  func testInvalidInputWithString() {
    // GIVEN a string that is not a hex-string
    let hex = "lorem ipsum"
    
    // WHEN we create a color from that string
    let result = Color(hex: hex)

    // THEN the default white color is returned.
    let colorWhite = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 1.0)
    XCTAssertEqual(result, colorWhite)
  }
}
