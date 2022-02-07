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

  static let customBrown = Color(hex: "773D1C")
  static let customPink = Color(hex: "E87AA4")
  static let customLightBlue = Color(hex: "87CEEB")
  static let customCyan = Color(hex: "00FFFF")
  static let customLightGreen = Color(hex: "77C344")
  static let customDarkGreen = Color(hex: "134B0E")
  static let customWhite = Color(hex: "F2F2F7")
  static let customBlack = Color(hex: "111111")

  /// Creates a SwiftUI color from a hex code. Can take
  /// input as 3, 6 or 8 characters, with or without a
  /// hash-sign prefixed, in upper or lower case.
  ///
  /// Returns .white on faulty input.
  ///
  /// Possible Inputs:
  /// - 12 Bit (3 characters): R G B, e.g. "FF0"
  /// - 24 Bit (6 characters): RR GG BB, e.g. "FF0000"
  /// - 32 Bit (8 characters): AA RR GG BB, e.g. "FFFF0000"
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = .zero
    Scanner(string: hex).scanHexInt64(&int)
    let alpha, red, green, blue: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      // Defaults to white on faulty input.
      (alpha, red, green, blue) = (255, 255, 255, 255)
    }

    self.init(
      .sRGB,
      red: Double(red) / 255,
      green: Double(green) / 255,
      blue: Double(blue) / 255,
      opacity: Double(alpha) / 255
    )
  }

  /// Returns a lighter version of the
  /// major color of a great houses sigil
  /// for use as background-color.
  static func greatHousesMajorColor(id: Int) -> Color {
    switch id {
    case 7:
      return Color(hex: "A8C0DC")
    case 17:
      return Color(hex: "EBE1A7")
    case 169:
      return Color(hex: "F5E6AA")
    case 229:
      return Color(hex: "D49995")
    case 285:
      return Color(hex: "E4C3A1")
    case 362:
      return Color(hex: "F0F0F0")
    case 378:
      return Color(hex: "DEADA9")
    case 395:
      return Color(hex: "9C9BD6")
    case 398:
      return Color(hex: "A8C998")
    default:
      return .white
    }
  }
}
