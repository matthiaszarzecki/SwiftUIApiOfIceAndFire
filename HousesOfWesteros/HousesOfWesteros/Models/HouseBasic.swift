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
  // The Api ALWAYS returns a string for each field. If a
  // field is not assigned it will return an empty string "".
  
  /// The number-id for the house. Is
  /// also the last part of the url.
  var id: Int? {
    let urlElements = url.components(separatedBy: "/")
    return Int(urlElements.last ?? "") ?? nil
  }
  
  let url: String
  let name: String
  let region: String
  let coatOfArms: String
  let motto: String
  let titles: [String]
  let seats: [String]
  let foundingPeriod: String
  let diedOutPeriod: String
  let ancestralWeapons: [String]

  // When assigned these fields are URL's as strings.
  let currentLord: String
  let heir: String
  let overlordHouse: String
  let foundedByCharacter: String
  let cadetBranches: [String]
  let swornMembers: [String]
  
  /// A Boolean indicating whether at least one
  /// field that can contain an URL has an URL.
  var containsLinks: Bool {
    // We are leaving out the "url" field as that URL
    // leads back to this house, and not anywhere else.
    return foundedByCharacter.isLink
      || currentLord.isLink
      || heir.isLink
      || overlordHouse.isLink
      || swornMembers.hasLinkEntries
      || cadetBranches.hasLinkEntries
  }

  /// The colors mentioned in the Coat
  /// of Arms, as SwiftUI Colors.
  var heraldryColors: [Color] {
    return ColorParser.getColors(fromString: coatOfArms)
  }

  /// The initial letter of the House-name
  /// without "House " (with space) prefixed.
  var initialLetter: String {
    return name[6]
  }
  
  /// Boolean indicating whether this house
  /// belongs to the great houses and has
  /// an image file associated.
  var isGreatHouse: Bool {
    if let unwrappedId = id {
      return Constants.greatHouses.contains(unwrappedId)
    }
    return false
  }
  
  enum CodingKeys: String, CodingKey {
    case url
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
