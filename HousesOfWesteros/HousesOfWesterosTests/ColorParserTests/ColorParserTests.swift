//
//  ColorParserTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import XCTest
import SwiftUI
@testable import HousesOfWesteros

class ColorParserTests: XCTestCase {
  func testGetSingleColor() {
    // GIVEN a string that contains a color mention
    let text = "gold"
    
    // WHEN we parse the string with the color-parser
    let result = ColorParser.getColors(fromString: text)
    
    // THEN we receive an array with a single
    // entry corresponding to the color.
    XCTAssertEqual([.yellow], result)
  }
  
  func testGetNoColor() {
    // GIVEN a string that contains no color mention
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
    
    // WHEN we parse the string with the color-parser
    let result = ColorParser.getColors(fromString: text)
    
    // THEN we receive an array with a single
    // entry corresponding to the color.
    XCTAssertEqual(Array<Color>(), result)
  }
  
  func testGetMultipleColors() {
    // GIVEN a string that contains multiple colors
    let text = "gold and red and green too"
    
    // WHEN we parse the string with the color-parser
    let result = ColorParser.getColors(fromString: text)
    
    // THEN we receive an array with a single
    // entry corresponding to the color.
    XCTAssertEqual([.yellow, .red, .green], result)
  }
  
  func testGetTheSameOrderOfColors() {
    // GIVEN two strings that contain multiple colors
    let textFirst = "gold and red and green too"
    let textSecond = "red and gold and green too"
    
    // WHEN we parse the strings with the color-parser
    let resultFirst = ColorParser.getColors(fromString: textFirst)
    let resultSecond = ColorParser.getColors(fromString: textSecond)
    
    // THEN the resulting orders of colors will be identical.
    XCTAssertEqual(resultFirst, resultSecond)
  }
}
