//
//  StringExtensionTests.swift
//  GotTestTests
//
//  Created by Matthias Zarzecki on 25.01.21.
//

import XCTest
@testable import HousesOfWesteros

class StringExtensionTests: XCTestCase {
  
  //MARK: - isLink Tests

  func testIsLink() {
    // GIVEN a string that is a hyperlink
    let string = "https://www.anapioficeandfire.com/api/characters/290"
    
    // WHEN we check if that is indeed a
    // link to access further data
    let result = string.isLink
    
    // THEN true is returned
    XCTAssertTrue(result)
  }
  
  func testIsNotLink() {
    // GIVEN a string that is not a hyperlink
    let string = "House Allyrion of Godsgrace"
    
    // WHEN we check if that is indeed a
    // link to access further data
    let result = string.isLink
    
    // THEN false is returned
    XCTAssertFalse(result)
  }
  
  //MARK: - Subscripting Tests
  
  func testSubScriptingAStringWithIndexZero() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it to access the first character
    let result = character[0]
    
    // THEN the respective character is returned
    XCTAssertEqual(result, "D")
  }
  
  func testSubScriptingAStringWithAMiddleIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it to access a character
    // in the middle of the string
    let result = character[3]
    
    // THEN the respective character is returned
    XCTAssertEqual(result, "o")
  }
  
  func testSubScriptingAStringWithMaxIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it to access the
    // character at the last index
    let result = character[15]
    
    // THEN the respective character is returned
    XCTAssertEqual(result, "n")
  }
  
  func testSubScriptingAStringWithMaxIndexPlusOne() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it to access a
    // character with an index 1 higher
    // than the last index
    let result = character[16]
    
    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
  
  func testSubScriptingAStringWithIndexOutOfBounds() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it with an index
    // that is longer than the string
    let result = character[99]
    
    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
  
  func testSubScriptingAnEmptyString() {
    // GIVEN an empty string
    let character = ""
    
    // WHEN we subscript it to access a character
    let result = character[3]
    
    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
  
  func testSubScriptingAStringWithANegativeIndex() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we subscript it with a negative index
    let result = character[-1]
    
    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
  
  // MARK: - First Tests
  
  func testFirst() {
    // GIVEN a string
    let character = "Delonne Allyrion"
    
    // WHEN we call the "first" computed variable
    let result = character.first
    
    // THEN the first character is returned
    XCTAssertEqual(result, "D")
  }
  
  func testFirstOnEmptyString() {
    // GIVEN an empty string
    let character = ""
    
    // WHEN we call the "first" computed variable
    let result = character.first
    
    // THEN an empty string is returned
    XCTAssertEqual(result, "")
  }
}
