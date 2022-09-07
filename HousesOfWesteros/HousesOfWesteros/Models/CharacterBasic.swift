//
//  Character.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

/// Contains all data related to a Character in ASOIAF.
struct CharacterBasic: Codable, Identifiable, Hashable {
  // The Api ALWAYS returns a string for each field. If a field
  // is not assigned it will return an empty string "".

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

  // The identifier for this house. Is
  // also the direct URL to its data.
  var id: String {
    url
  }

  let url: String

  /// Name of the character. Use displayName
  /// instead when using name for display.
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
    displayName.first
  }

  /// A boolean indicating whether this
  /// character was portrayed by an actor.
  var hasActor: Bool {
    portrayedBy.hasNonEmptyEntries
  }

  /// Returns the name of the character. If
  /// the name is empty tries to return an
  /// alias. Returns empty string otherwise.
  var displayName: String {
    if name.isEmpty {
      if aliases.hasNonEmptyEntries {
        if let firstAlias = aliases.first {
          return firstAlias
        }
      } else {
        return "Unknown Name"
      }
    }

    return name
  }

  /// A boolean indicating whether this character
  /// has any information at all that would be
  /// displayed on a character-page.
  var hasInformation: Bool {
    // We are leaving out the "url" field as that URL
    // leads back to this character, and not anywhere else.
    culture.exists ||
      born.exists ||
      died.exists ||
      titles.hasNonEmptyEntries ||
      aliases.hasNonEmptyEntries ||
      tvShowAppearances.hasNonEmptyEntries ||
      portrayedBy.hasNonEmptyEntries
  }
}
