//
//  String-Extension.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

extension String: Identifiable {
  /// For the Identifiable-protocol, allows a string to be used in a fullScreenCover<Item, Content>
  public var id: Self { self }
}
