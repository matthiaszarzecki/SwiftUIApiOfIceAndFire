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

    let words = text.lowercased().components(separatedBy: " ")
    // Also remove punctuation
    
    let synonymsForRed = ["red", "gules", "sanguine", "fiery"]
    if words.contains(where: synonymsForRed.contains) {
      colors.append(.red)
    }
    
    let synonymsForGreen = ["green", "vert"]
    if words.contains(where: synonymsForGreen.contains) {
      colors.append(.green)
    }
    
    let synonymsForBlue = ["blue", "azure"]
    if words.contains(where: synonymsForBlue.contains) {
      colors.append(.blue)
    }
    
    let synonymsForBlack = ["black", "sable"]
    if words.contains(where: synonymsForBlack.contains) {
      colors.append(.black)
    }
    
    let synonymsForPink = ["pink"]
    if words.contains(where: synonymsForPink.contains) {
      colors.append(.pink)
    }
    
    let synonymsForYellow = ["yellow", "gold", "golden", "or", "sun"]
    if words.contains(where: synonymsForYellow.contains) {
      colors.append(.yellow)
    }
    
    let synonymsForWhite = ["argent", "silver", "white"]
    if words.contains(where: synonymsForWhite.contains) {
      colors.append(.white)
    }
    
    let synonymsForPurple = ["purple", "purpure", "murrey"]
    if words.contains(where: synonymsForPurple.contains) {
      colors.append(.white)
    }
    
    let synonymsForOrange = ["orange", "tenné", "tenny", "ochre"]
    if words.contains(where: synonymsForOrange.contains) {
      colors.append(.white)
    }
    
    let synonymsForGray = ["grey", "gray", "gules", "cendrée"]
    if words.contains(where: synonymsForGray.contains) {
      colors.append(.gray)
    }
    
    let synonymsForLightBlue = ["sky", "celeste"]
    if words.contains(where: synonymsForLightBlue.contains) {
      //Add color-extension
      // add sky blue #87ceeb
    }
    
    return colors
  }
}
