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
  var currentLord: String
  var heir: String
  var overlord: String
  let founded: String
  var founder: String
  let diedOut: String
  let ancestralWeapons: [String]
  var cadetBranches: [String]
  var swornMembers: [String]
  
  /// Tells whether any field that can contain an URL contains an URL
  var cointainsUrls: Bool {
    return founder.contains("http") || currentLord.contains("http") || heir.contains("http") || (swornMembers.count > 0 && swornMembers[0].contains("http")) || (cadetBranches.count > 0 && cadetBranches[0].contains("http"))
  }
  
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

struct HouseUpdated {
  let id: String
  let name: String
  let region: String
  let coatOfArms: String
  let words: String
  let titles: [String]
  let seats: [String]
  let founded: String
  let diedOut: String
  let ancestralWeapons: [String]
  
  var currentLord: Character?
  var heir: Character?
  var overlord: House?
  var founder: Character?
  var cadetBranches: [House]?
  var swornMembers: [Character]?
  
  init(
    fromHouse house: House,
    currentLord: Character? = nil,
    heir: Character? = nil,
    overlord: House? = nil,
    founder: Character? = nil,
    cadetBranches: [House]? = nil,
    swornMembers: [Character]? = nil
  ) {
    id = house.id
    name = house.name
    region = house.region
    coatOfArms = house.coatOfArms
    words = house.words
    titles = house.titles
    seats = house.seats
    founded = house.founded
    diedOut = house.diedOut
    ancestralWeapons = house.ancestralWeapons
    
    self.currentLord = currentLord
    self.heir = heir
    self.overlord = overlord
    self.founder = founder
    self.cadetBranches = cadetBranches
    self.swornMembers = swornMembers
  }
}
