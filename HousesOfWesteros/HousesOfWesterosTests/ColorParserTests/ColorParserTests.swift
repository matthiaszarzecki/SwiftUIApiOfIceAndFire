//
//  ColorParserTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 21.04.21.
//

import SwiftUI
import XCTest
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

  func testGetSingleColorFromMultipleMentions() {
    // GIVEN a string that contains the same color
    // being mentioned multiple times
    let text = "gold, yellow, or"

    // WHEN we parse the string with the color-parser
    let result = ColorParser.getColors(fromString: text)

    // THEN we receive an array with a single
    // entry corresponding to the color.
    XCTAssertEqual([.yellow], result)
  }

  func testGetNoColor() {
    // GIVEN a string that contains no color mention
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"

    // WHEN we parse the string with the color-parser
    let result = ColorParser.getColors(fromString: text)

    // THEN we receive an array with a single
    // entry corresponding to the color.
    XCTAssertEqual([Color](), result)
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

  func testGetAllColors() {
    // GIVEN a strings that contains all possible colors
    let text = """
      gold, orange, brown, red, pink, purple, blue, sky,
      cyan, pale-green, green, dark-green, white, grey, black
      """

    // WHEN we parse the strings with the color-parser
    let result = ColorParser.getColors(fromString: text)

    // THEN the resulting orders of colors will be identical.
    let allColors: [Color] = [
      .yellow,
      .orange,
      .customBrown,
      .red,
      .customPink,
      .purple,
      .blue,
      .customLightBlue,
      .customCyan,
      .customLightGreen,
      .green,
      .customDarkGreen,
      .customWhite,
      .gray,
      .customBlack
    ]
    XCTAssertEqual(result, allColors)
  }
}
