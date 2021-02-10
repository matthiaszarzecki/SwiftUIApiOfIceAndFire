//
//  House.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

/// Contains all data related to a House in ASOIAF.
struct HouseBasic: Codable, Identifiable, Hashable {
  /// The identifier for this house. Is also the direct url to its
  /// data. Must be named "id" to conform to identifiable protocol.
  let id: String
  
  // Api ALWAYS returns a string for each field. If a field
  // is not assigned it will return an empty string "".
  let name: String
  let region: String
  let coatOfArms: String
  let motto: String
  let titles: [String]
  let seats: [String]
  let currentLord: String
  let heir: String
  let overlordHouse: String
  let foundingPeriod: String
  let foundedByCharacter: String
  let diedOutPeriod: String
  let ancestralWeapons: [String]
  let cadetBranches: [String]
  let swornMembers: [String]
  
  /// Tells whether at least one field that can contain an URL has an URL
  var cointainsLinks: Bool {
    return foundedByCharacter.isLink || currentLord.isLink || heir.isLink || (swornMembers.count > 0 && swornMembers[0].isLink) || (cadetBranches.count > 0 && cadetBranches[0].isLink)
  }
  
  enum CodingKeys: String, CodingKey {
    case id = "url"
    case name
    case region
    case coatOfArms
    case motto = "words"
    case titles
    case seats
    case currentLord
    case heir
    case overlordHouse = "overlord"
    case foundingPeriod = "founded"
    case foundedByCharacter = "founder"
    case diedOutPeriod = "diedOut"
    case ancestralWeapons
    case cadetBranches
    case swornMembers
  }
}
