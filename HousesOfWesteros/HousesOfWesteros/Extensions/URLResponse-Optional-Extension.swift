//
//  URLResponse-Extension.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 14.04.21.
//

import Foundation

extension Optional where Wrapped == URLResponse {
  /// Returns the HTTP status code from an
  /// URLResponse-Optional. Returns nil on failure.
  var statusCode: Int? {
    if let httpResponse = self as? HTTPURLResponse {
      return httpResponse.statusCode
    }
    return nil
  }
}
