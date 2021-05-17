//
//  StringExistsTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class StringExistsTests: XCTestCase {
  func testStringExists() {
    // GIVEN a non-empty string
    let character = "Lorem"
    
    // WHEN we call the "exists" computed variable
    let result = character.exists
    
    // THEN true is returned
    XCTAssertTrue(result)
  }
  
  func testStringDoesNotExist() {
    // GIVEN an empty string
    let character = ""
    
    // WHEN we call the "exists" computed variable
    let result = character.exists
    
    // THEN true is returned
    XCTAssertFalse(result)
  }
}
