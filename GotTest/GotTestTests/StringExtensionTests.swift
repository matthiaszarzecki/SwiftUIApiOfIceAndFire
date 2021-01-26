//
//  StringExtensionTests.swift
//  GotTestTests
//
//  Created by Matthias Zarzecki on 25.01.21.
//

import XCTest
@testable import GotTest

class StringExtensionTests: XCTestCase {
  
  func testIsLink() throws {
    // GIVEN a string that is a hyperlink
    let character = MockClasses.characterLink
    
    // WHEN we check if that is indeed a link to access further data
    let result = character.isLink
    
    // THEN true is returned
    XCTAssertTrue(result)
  }
  
  func testIsNotLink() throws {
    // GIVEN a string that is not a hyperlink
    let house = MockClasses.houseName
    
    // WHEN we check if that is indeed a link to access further data
    let result = house.isLink
    
    // THEN false is returned
    XCTAssertFalse(result)
  }
}
