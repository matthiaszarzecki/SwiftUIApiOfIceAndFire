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
  /// these into an array of SwiftUI Colors
  static func getColors(fromString text: String) -> [Color] {
    var colors: [Color] = []

    // Turn test lowercase for easier comparison
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
    
    // Turn string into array for easier comparison
    var words = adaptedText.components(separatedBy: " ")
    
    // Remove empty array entries
    words.removeAll { $0 == "" }
    
    // Check if any words that describe colors are present, and
    // if so add the corresponding color to the return-collection.
    let synonymsForYellow = ["yellow", "gold", "golden", "or", "sun"]
    if words.contains(where: synonymsForYellow.contains) {
      colors.append(.yellow)
    }
    
    let synonymsForOrange = ["orange", "tenné", "tenny", "ochre", "copper", "saffron", "rusty", "black-and-orange", "bronze"]
    if words.contains(where: synonymsForOrange.contains) {
      colors.append(.orange)
    }
    
    let synonymsForBrown = ["brown", "ermine", "erminois", "oaken", "oak", "tree"]
    if words.contains(where: synonymsForBrown.contains) {
      let customBrownColor = Color(hex: "773D1C")
      colors.append(customBrownColor)
    }
    
    let synonymsForRed = ["red", "gules", "sanguine", "fiery", "blood", "bloody", "pommes"]
    if words.contains(where: synonymsForRed.contains) {
      colors.append(.red)
    }
    
    let synonymsForPink = ["pink", "carnation"]
    if words.contains(where: synonymsForPink.contains) {
      let customPinkColor = Color(hex: "E87AA4")
      colors.append(customPinkColor)
    }
    
    let synonymsForPurple = ["purple", "purpure", "murrey", "grape", "amaranth"]
    if words.contains(where: synonymsForPurple.contains) {
      colors.append(.purple)
    }
    
    let synonymsForBlue = ["blue", "azure", "indigo", "fountain"]
    if words.contains(where: synonymsForBlue.contains) {
      colors.append(.blue)
    }
    
    let synonymsForLightBlue = ["sky", "celeste", "sky-blue"]
    if words.contains(where: synonymsForLightBlue.contains) {
      let customLightBlueColor = Color(hex: "87CEEB")
      colors.append(customLightBlueColor)
    }
    
    let synonymsForCyan = ["cyan", "turquoise"]
    if words.contains(where: synonymsForCyan.contains) {
      let customCyanColor = Color(hex: "00FFFF")
      colors.append(customCyanColor)
    }
    
    let synonymsForLightGreen = ["pale-green"]
    if words.contains(where: synonymsForLightGreen.contains) {
      let customLightGreenColor = Color(hex: "77C344")
      colors.append(customLightGreenColor)
    }
    
    let synonymsForGreen = ["green", "vert"]
    if words.contains(where: synonymsForGreen.contains) {
      colors.append(.green)
    }
    
    let synonymsForDarkGreen = ["dark-green"]
    if words.contains(where: synonymsForDarkGreen.contains) {
      let customDarkGreenColor = Color(hex: "134B0E")
      colors.append(customDarkGreenColor)
    }

    let synonymsForWhite = ["white", "argent", "silver", "ice", "fountain"]
    if words.contains(where: synonymsForWhite.contains) {
      let customWhiteColor = Color(hex: "F2F2F7")
      colors.append(customWhiteColor)
    }
     
    let synonymsForGray = ["grey", "gray", "gules", "cendrée"]
    if words.contains(where: synonymsForGray.contains) {
      colors.append(.gray)
    }
    
    let synonymsForBlack = ["black", "sable", "black-and-orange"]
    if words.contains(where: synonymsForBlack.contains) {
      let customBlackColor = Color(hex: "111111")
      colors.append(customBlackColor)
    }
    
    return colors
  }
}
