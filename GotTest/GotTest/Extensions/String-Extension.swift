//
//  String-Extension.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

extension String: Identifiable {
  /// For the Identifiable-protocol
  public var id: Self { self }
}
