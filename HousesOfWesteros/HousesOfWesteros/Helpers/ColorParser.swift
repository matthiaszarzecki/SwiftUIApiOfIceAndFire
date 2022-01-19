//
//  ColorParser.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import Foundation
import SwiftUI

struct ColorParser {
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
    words.removeAll { $0 == "" || $0 == " " }

    // Check if any words that describe colors are present, and
    // if so add the corresponding color to the return-collection.
    let synonymsForYellow = ["yellow", "gold", "golden", "or", "sun"]
    if words.hasAtLeastOneItem(fromArray: synonymsForYellow) {
      colors.append(.yellow)
    }

    let synonymsForOrange = ["orange", "tenné", "tenny", "ochre", "copper", "saffron", "rusty", "black-and-orange", "bronze"]
    if words.hasAtLeastOneItem(fromArray: synonymsForOrange) {
      colors.append(.orange)
    }

    let synonymsForBrown = ["brown", "ermine", "ermines", "erminois", "oaken", "oak", "tree", "moose"]
    if words.hasAtLeastOneItem(fromArray: synonymsForBrown) {
      colors.append(.customBrown)
    }

    let synonymsForRed = ["red", "gules", "sanguine", "fiery", "blood", "bloody", "pommes"]
    if words.hasAtLeastOneItem(fromArray: synonymsForRed) {
      colors.append(.red)
    }

    let synonymsForPink = ["pink", "carnation"]
    if words.hasAtLeastOneItem(fromArray: synonymsForPink) {
      colors.append(.customPink)
    }

    let synonymsForPurple = ["purple", "purpure", "murrey", "grape", "amaranth"]
    if words.hasAtLeastOneItem(fromArray: synonymsForPurple) {
      colors.append(.purple)
    }

    let synonymsForBlue = ["blue", "azure", "indigo", "fountain", "vair"]
    if words.hasAtLeastOneItem(fromArray: synonymsForBlue) {
      colors.append(.blue)
    }

    let synonymsForLightBlue = ["sky", "celeste", "sky-blue"]
    if words.hasAtLeastOneItem(fromArray: synonymsForLightBlue) {
      colors.append(.customLightBlue)
    }

    let synonymsForCyan = ["cyan", "turquoise", "blue-green"]
    if words.hasAtLeastOneItem(fromArray: synonymsForCyan) {
      colors.append(.customCyan)
    }

    let synonymsForLightGreen = ["pale-green"]
    if words.hasAtLeastOneItem(fromArray: synonymsForLightGreen) {
      colors.append(.customLightGreen)
    }

    let synonymsForGreen = ["green", "vert"]
    if words.hasAtLeastOneItem(fromArray: synonymsForGreen) {
      colors.append(.green)
    }

    let synonymsForDarkGreen = ["dark-green", "grey-green"]
    if words.hasAtLeastOneItem(fromArray: synonymsForDarkGreen) {
      colors.append(.customDarkGreen)
    }

    let synonymsForWhite = ["white", "argent", "silver", "ice", "fountain", "ice-white", "scythe"]
    if words.hasAtLeastOneItem(fromArray: synonymsForWhite) {
      colors.append(.customWhite)
    }

    let synonymsForGray = ["grey", "gray", "gules", "cendrée", "sword", "scythe"]
    if words.hasAtLeastOneItem(fromArray: synonymsForGray) {
      colors.append(.gray)
    }

    let synonymsForBlack = ["black", "sable", "black-and-orange"]
    if words.hasAtLeastOneItem(fromArray: synonymsForBlack) {
      colors.append(.customBlack)
    }

    return colors
  }
}
