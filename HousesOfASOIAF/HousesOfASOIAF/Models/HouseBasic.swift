//
//  House.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation
import SwiftUI

/// Contains all data related to a House in ASOIAF.
struct HouseBasic: Codable, Identifiable, Hashable {
  // Api ALWAYS returns a string for each field. If a field
  // is not assigned it will return an empty string "".
  
  /// The identifier for this house. Is also the direct url to its
  /// data. Must be named "id" to conform to identifiable protocol.
  let id: String
  
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
  
  /// A Boolean indicating whether at least one field that can contain an URL has an URL.
  var containsLinks: Bool {
    return foundedByCharacter.isLink || currentLord.isLink || heir.isLink || swornMembers.hasLinkEntries || cadetBranches.hasLinkEntries
  }
  
  var heraldryColors: [Color] {
    return ColorParser().getColors(fromString: coatOfArms)
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
