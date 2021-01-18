//
//  House.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

/// Contains all data related to a House in ASOIAF.
struct House: Codable, Identifiable, Hashable {
  /// The identifier for this house. Is also the direct url to its
  /// data. Needs to be named "id" to conform to identifiable protocol.
  let id: String
  let name: String
  let region: String
  let coatOfArms: String
  let words: String
  let titles: [String]
  let seats: [String]
  let currentLord: String
  let heir: String
  let overlord: String
  let founded: String
  var founder: String
  let diedOut: String
  let ancestralWeapons: [String]
  let cadetBranches: [String]
  let swornMembers: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "url"
    case name
    case region
    case coatOfArms
    case words
    case titles
    case seats
    case currentLord
    case heir
    case overlord
    case founded
    case founder
    case diedOut
    case ancestralWeapons
    case cadetBranches
    case swornMembers
  }
}
