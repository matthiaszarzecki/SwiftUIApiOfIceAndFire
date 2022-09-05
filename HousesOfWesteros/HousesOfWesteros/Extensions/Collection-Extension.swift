//
//  Collection-Extension.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 05.09.22.
//

import Foundation

extension Collection {
  /// Returns the object at the specified index. Returns nil when
  /// out of bounds (unlike regular arrays, which would crash).
  /// It is less performant then regular accessing, and should be
  /// avoided when doing lots of accesses that are sure to succeed.
  subscript (safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
