//
//  Data-Optional-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 25.02.21.
//

import Foundation

extension Data {
  func printJsonFromData() {
    print("JSON String: \(String(data: self, encoding: .utf8) ?? "")")
  }
}
