//
//  ArrayExtensionTests.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 17.05.21.
//

import XCTest
@testable import HousesOfWesteros

class ArrayHasEntriesTests: XCTestCase {
  func testHasEntries() {
    // GIVEN an array with multiple entries
    let array = [1, 2, 3]
    
    // WHEN we call the hasEntries variable
    let result = array.hasEntries
    
    // THEN true is returned
    XCTAssertTrue(result)
  }
  
  func testHasNoEntries() {
    // GIVEN an empty array
    let array = [Int]()
    
    // WHEN we call the hasEntries variable
    let result = array.hasEntries
    
    // THEN false is returned
    XCTAssertFalse(result)
  }
}
