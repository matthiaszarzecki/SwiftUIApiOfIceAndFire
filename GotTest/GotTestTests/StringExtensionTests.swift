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
    let character = MockClasses.characterLink
    XCTAssertTrue(character.isLink)
  }
  
  func testIsNotLink() throws {
    let house = MockClasses.houseName
    XCTAssertFalse(house.isLink)
  }
}
