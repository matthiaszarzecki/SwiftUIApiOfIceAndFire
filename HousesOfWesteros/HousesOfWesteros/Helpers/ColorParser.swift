//
//  ColorParser.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import Foundation
import SwiftUI

enum ColorParser {
  static private let synonymsForYellow = ["yellow", "gold", "golden", "or", "sun"]
  static private let synonymsForOrange = [
    "orange",
    "tenné",
    "tenny",
    "ochre",
    "copper",
    "saffron",
    "rusty",
    "black-and-orange",
    "bronze"
  ]
  static private let synonymsForBrown = ["brown", "ermine", "ermines", "erminois", "oaken", "oak", "tree", "moose"]
  static private let synonymsForRed = ["red", "gules", "sanguine", "fiery", "blood", "bloody", "pommes"]
  static private let synonymsForPink = ["pink", "carnation"]
  static private let synonymsForPurple = ["purple", "purpure", "murrey", "grape", "amaranth"]
  static private let synonymsForBlue = ["blue", "azure", "indigo", "fountain", "vair"]
  static private let synonymsForLightBlue = ["sky", "celeste", "sky-blue"]
  static private let synonymsForCyan = ["cyan", "turquoise", "blue-green"]
  static private let synonymsForLightGreen = ["pale-green"]
  static private let synonymsForGreen = ["green", "vert"]
  static private let synonymsForDarkGreen = ["dark-green", "grey-green"]
  static private let synonymsForWhite = ["white", "argent", "silver", "ice", "fountain", "ice-white", "scythe"]
  static private let synonymsForGray = ["grey", "gray", "gules", "cendrée", "sword", "scythe"]
  static private let synonymsForBlack = ["black", "sable", "black-and-orange"]

  /// Reads the colors named in a string and turns
  /// these into an array of SwiftUI Colors.
  static func getColors(fromString text: String) -> [Color] {
    // This has to be an array as sets are unordered.
    var colors: [Color] = []

    // Turn text lowercase for easier comparison.
    var adaptedText = text.lowercased()

    // Remove punctuation - replaces it with spaces, so
    // that the words can be turned into an array later.
    // We DO NOT remove hyphens "-", as those are part
    // of some colors, like "dark-green".
    adaptedText = adaptedText.replacingOccurrences(
      of: "[.,:;()_]",
      with: " ",
      options: .regularExpression
    )

    // Turn string into array for easier comparison.
    var words = adaptedText.components(separatedBy: " ")

    // Remove empty array entries.
    words.removeAll { $0.isEmpty || $0 == " " }

    // Check if any words that describe colors are present, and
    // if so add the corresponding color to the return-collection.
    if words.hasAtLeastOneItem(fromArray: synonymsForYellow) {
      colors.append(.yellow)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForOrange) {
      colors.append(.orange)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForBrown) {
      colors.append(.customBrown)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForRed) {
      colors.append(.red)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForPink) {
      colors.append(.customPink)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForPurple) {
      colors.append(.purple)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForBlue) {
      colors.append(.blue)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForLightBlue) {
      colors.append(.customLightBlue)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForCyan) {
      colors.append(.customCyan)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForLightGreen) {
      colors.append(.customLightGreen)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForGreen) {
      colors.append(.green)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForDarkGreen) {
      colors.append(.customDarkGreen)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForWhite) {
      colors.append(.customWhite)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForGray) {
      colors.append(.gray)
    }

    if words.hasAtLeastOneItem(fromArray: synonymsForBlack) {
      colors.append(.customBlack)
    }

    return colors
  }
}
