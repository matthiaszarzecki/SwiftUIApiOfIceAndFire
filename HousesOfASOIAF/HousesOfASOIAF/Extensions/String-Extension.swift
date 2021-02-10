//
//  String-Extension.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

extension String {
  /// Tells whether a string is actually an URL.
  public var isLink: Bool {
    // Doing a quick check here as this one will be called A LOT, and
    // is presumably quicker than URL-casting or using a RegEx.
    return self.contains("http")
  }
}

extension String: Identifiable {
  /// For the Identifiable-protocol
  public var id: Self { self }
}
