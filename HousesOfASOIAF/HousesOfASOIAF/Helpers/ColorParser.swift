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
  func getColors(fromString text: String) -> [Color] {
    var colors: [Color] = []

    // Lowercase text for easier comparison
    var adaptedText = text.lowercased()
    
    // Remove punctuation - replaces it with spaces, so
    // that the words can be turned into an array later
    adaptedText = adaptedText.replacingOccurrences(
      of: "[,:;()-_]",
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
    
    let synonymsForOrange = ["orange", "tenné", "tenny", "ochre"]
    if words.contains(where: synonymsForOrange.contains) {
      colors.append(.orange)
    }
    
    let synonymsForRed = ["red", "gules", "sanguine", "fiery"]
    if words.contains(where: synonymsForRed.contains) {
      colors.append(.red)
    }
    
    let synonymsForPink = ["pink"]
    if words.contains(where: synonymsForPink.contains) {
      colors.append(.pink)
    }
    
    let synonymsForPurple = ["purple", "purpure", "murrey"]
    if words.contains(where: synonymsForPurple.contains) {
      colors.append(.purple)
    }
    
    let synonymsForBlue = ["blue", "azure"]
    if words.contains(where: synonymsForBlue.contains) {
      colors.append(.blue)
    }
    
    let synonymsForLightBlue = ["sky", "celeste"]
    if words.contains(where: synonymsForLightBlue.contains) {
      let customLightBlueColor = Color(hex: "#87CEEB")
      colors.append(customLightBlueColor)
    }
    
    let synonymsForGreen = ["green", "vert"]
    if words.contains(where: synonymsForGreen.contains) {
      colors.append(.green)
    }

    let synonymsForWhite = ["white", "argent", "silver"]
    if words.contains(where: synonymsForWhite.contains) {
      let customWhiteColor = Color(hex: "F2F2F7")
      colors.append(customWhiteColor)
    }
     
    let synonymsForGray = ["grey", "gray", "gules", "cendrée"]
    if words.contains(where: synonymsForGray.contains) {
      colors.append(.gray)
    }
    
    let synonymsForBlack = ["black", "sable"]
    if words.contains(where: synonymsForBlack.contains) {
      let customBlackColor = Color(hex: "111111")
      colors.append(customBlackColor)
    }
    
    return colors
  }
}
