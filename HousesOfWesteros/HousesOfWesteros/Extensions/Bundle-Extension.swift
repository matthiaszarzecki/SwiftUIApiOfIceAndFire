//
//  Bundle-Extension.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 26.11.21.
//

import Foundation

extension Bundle {
  /// The name of the app, as it appears on the home-screen.
  static var appVersion: String {
    return self.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
  }
}
