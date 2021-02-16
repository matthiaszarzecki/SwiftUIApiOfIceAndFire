//
//  Array-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 12.02.21.
//

import Foundation

extension Array where Element == String {
  /// Returns true if the array contains at least
  /// one entry that is also in the passed array.
  func hasAtLeastOneItem(fromArray array: [String]) -> Bool {
    return self.contains(where: array.contains)
  }
  
  /// Returns true if the array has usable entries.
  var hasNonEmptyEntries: Bool {
    return self.hasEntries && self[0] != ""
  }
  
  /// A Boolean indicating whether an array contains hyperlinks.
  var hasLinkEntries: Bool {
    return self.hasEntries && self[0].isLink
  }
}
