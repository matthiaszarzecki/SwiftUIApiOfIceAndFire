//
//  Color-Extension.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

extension Color {
  static let westerosRed = Color(hex: "9C1E19")
  static let redactedGray = Color(hex: "D6D6D6")
  
  /// Creates a SwiftUI color from a hex code. Can take
  /// input as 3, 6 or 8 characters, with or without a
  /// hash-sign prefixed, in upper or lower case.
  /// - 12 Bit (3 characters): R G B, e.g. "FF0"
  /// - 24 Bit (6 characters): RR GG BB, e.g. "FF0000"
  /// - 32 Bit (8 characters): AA RR GG BB, e.g. "FFFF0000"
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      // Defaults to white on faulty input.
      (a, r, g, b) = (255, 255, 255, 255)
    }
    
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue: Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
