//
//  Array-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 12.02.21.
//

import Foundation

extension Array {
  /// A Boolean value indicating whether an array has entries.
  /// Use hasNonEmptyEntries when this is a string-array.
  var hasEntries: Bool {
    !isEmpty
  }
}
