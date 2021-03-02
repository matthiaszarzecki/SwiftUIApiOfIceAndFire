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
  
  // The identifier for this house. Is also the direct URL to its
  // data. Must be named "id" to conform to the identifiable protocol.
  
  let id: String
  let name: String
  let culture: String
  let born: String
  let died: String
  let titles: [String]
  let aliases: [String]
  let tvShowAppearances: [String]
  let portrayedBy: [String]
  
  // When assigned these fields are URL's as strings.
  let father: String
  let mother: String
  let spouse: String
  let allegiances: [String]
  let bookAppearances: [String]
  let hasPointOfViewChaptersInBooks: [String]
  
  var initialLetter: String {
    return name.first
  }
  
  /// A boolean indicating whether this
  /// character was portayed by an actor.
  var hasActor: Bool {
    return portrayedBy.hasNonEmptyEntries
  }
  
  enum CodingKeys: String, CodingKey {
    case id = "url"
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
