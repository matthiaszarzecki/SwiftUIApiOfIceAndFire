//
//  StringCapitalizeFirstLetterTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringCapitalizeFirstLetterTests: XCTestCase {
  func testStringCapitalizeFirstLetter() {
    // GIVEN a string beginning with a lowercase letter
    let string = "lorem"
    
    // WHEN we call the "CapitalizeFirstLetter" function
    let result = string.capitalizeFirstLetter()
    
    // THEN the new string is not the same
    XCTAssertNotEqual(string, result)
    
    // AND the new string's first character is capitalized
    XCTAssertEqual(result, "Lorem")
  }
  
  func testEmptyStringCapitalizeFirstLetter() {
    // GIVEN an empty string
    let string = ""
    
    // WHEN we call the "CapitalizeFirstLetter" function
    let result = string.capitalizeFirstLetter()
    
    // THEN the new string is also empty
    XCTAssertEqual(result, "")
  }
}
