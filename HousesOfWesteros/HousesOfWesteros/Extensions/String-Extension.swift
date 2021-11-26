//
//  String-Extension.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

extension String {
  /// Returns the first character as String. Returns
  /// an empty string when called on an empty string.
  var first: String {
    return self[0]
  }
  
  /// Allows to access characters as strings via
  /// array-index, e.g. "hello[2]". Returns an
  /// empty string when string is already empty,
  /// or the index is out of bounds.
  subscript (index: Int) -> String {
    if self.isEmpty || index >= self.count || index < 0 {
      return ""
    }
    
    return String(self[self.index(self.startIndex, offsetBy: index)])
  }
  
  /// A Boolean value indicating whether
  /// a string has characters.
  public var exists: Bool {
    return !self.isEmpty
  }
  
  /// A Boolean value indicating whether a
  /// string is actually an URL.
  public var isLink: Bool {
    // Doing a quick check here as this one will be called A LOT, and
    // is presumably quicker than URL-casting or using a RegEx.
    return self.contains("http")
  }
  
  /// Returns a new string with the
  /// first letter capitalized.
  func capitalizeFirstLetter() -> String {
    return prefix(1).capitalized + dropFirst()
  }
  
  /// Capitalizes the first letter
  /// of a string in place.
  mutating func capitalizeFirstLetterInPlace() {
    self = self.capitalizeFirstLetter()
  }
}
