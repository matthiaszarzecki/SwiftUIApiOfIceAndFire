//
//  Bundle-Extension.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 26.11.21.
//

import Foundation

extension Bundle {
  /// The version of the app, as defined in the build-settings.
  static var appVersion: String {
    main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
  }
}
