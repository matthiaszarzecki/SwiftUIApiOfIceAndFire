//
//  String-Extension.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

extension String {
  /// Tells whether a string is actually an URL.
  public var isUrl: Bool {
    // There are lots of valid alternatives on how to accomplish this.
    return self.contains("http")
  }
}

extension String: Identifiable {
  /// For the Identifiable-protocol
  public var id: Self { self }
}
