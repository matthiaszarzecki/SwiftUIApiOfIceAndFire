//
//  Array-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 12.02.21.
//

import Foundation

extension Array where Element == String {
  /// Returns true if the array has usable entries.
  /// Checks that there are >0 entries and the first
  /// one is not an empty string.
  var hasNonEmptyEntries: Bool {
    if hasEntries,
      let first = first,
      first.exists {
      return true
    }

    return false
  }

  /// A Boolean indicating whether an array
  /// contains hyperlinks. Checks that there are
  /// >0 entries and if the first entry is a link.
  var hasLinkEntries: Bool {
    if hasEntries, let first = first {
      return first.isLink
    }
    return false
  }

  /// Returns true if the array contains at least
  /// one entry that is also in the passed array.
  func hasAtLeastOneItem(fromArray array: [String]) -> Bool {
    contains(where: array.contains)
  }
}
