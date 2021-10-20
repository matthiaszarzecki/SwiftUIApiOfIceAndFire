//
//  String-Extension-Main-App.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 20.10.21.
//

// Apparently the widget-target already implements this protocol
// for a string, and complains when it is re-implemented in the same
// build-target. For now we create this one separately here.
extension String: Identifiable {
  /// Necessary for the Identifiable-protocol.
  public var id: Self { self }
}
