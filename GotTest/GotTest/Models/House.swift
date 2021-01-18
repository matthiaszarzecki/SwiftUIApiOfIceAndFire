//
//  House.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

/// Contains all data related to a House in ASOIAF.
struct House: Codable, Identifiable, Hashable {
  let id = UUID()
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
  let founder: String
  let diedOut: String
  let ancestralWeapons: [String]
  let cadetBranches: [String]
  let swornMembers: [String]
}
