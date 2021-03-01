//
//  Character.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

/// Contains all data related to a Character in ASOIAF.
struct CharacterBasic: Codable, Hashable {
  // The Api ALWAYS returns a string for each field. If a field
  // is not assigned it will return an empty string "".
  
  let url: String
  let name: String
  let culture: String
  let born: String
  let died: String
  let titles: [String]
  let aliases: [String]
  let father: String
  let mother: String
  let spouse: String
  let allegiances: [String]
  let bookAppearances: [String]
  let hasPointOfViewChaptersInBooks: [String]
  let tvShowAppearances: [String]
  let portrayedBy: [String]
  
  var initialLetter: String {
    return name[0]
  }
  
  /// A boolean indicating whether this
  /// character was portayed by an actor.
  var hasActor: Bool {
    return portrayedBy.hasNonEmptyEntries
  }
  
  enum CodingKeys: String, CodingKey {
    case url
    case name
    case culture
    case born
    case died
    case titles
    case aliases
    case father
    case mother
    case spouse
    case allegiances
    case bookAppearances = "books"
    case hasPointOfViewChaptersInBooks = "povBooks"
    case tvShowAppearances = "tvSeries"
    case portrayedBy = "playedBy"
  }
}
