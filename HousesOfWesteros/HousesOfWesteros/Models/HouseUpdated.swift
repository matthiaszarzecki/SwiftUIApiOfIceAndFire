//
//  HouseUpdated.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import Foundation
import SwiftUI

/// The house-data but with the URL's called
/// and replaced by their corresponding data.
struct HouseUpdated {
  let id: Int?
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

  /// The colors mentioned in the
  /// Coat of Arms, as SwiftUI Colors.
  let heraldryColors: [Color]

  /// The initial letter of the House name
  /// without "House " (with space) prefixed.
  let initialLetter: String

  /// A Boolean indicating whether a
  /// subview is linked from this house.
  /// Is initialed from "containsLinks"
  /// value from HouseBasic.
  let containsSubViews: Bool

  let isGreatHouse: Bool

  var currentLord: CharacterBasic?
  var heir: CharacterBasic?
  var overlordHouse: HouseBasic?
  var foundedByCharacter: CharacterBasic?
  var cadetBranches: [HouseBasic]
  var swornMembers: [CharacterBasic]

  init(
    fromHouse house: HouseBasic,
    currentLord: CharacterBasic? = nil,
    heir: CharacterBasic? = nil,
    overlord: HouseBasic? = nil,
    founder: CharacterBasic? = nil,
    cadetBranches: [HouseBasic] = [],
    swornMembers: [CharacterBasic] = []
  ) {
    id = house.id
    url = house.url
    name = house.name
    region = house.region
    coatOfArms = house.coatOfArms
    motto = house.motto
    titles = house.titles
    seats = house.seats
    foundingPeriod = house.foundingPeriod
    diedOutPeriod = house.diedOutPeriod
    ancestralWeapons = house.ancestralWeapons
    heraldryColors = house.heraldryColors
    initialLetter = house.initialLetter
    containsSubViews = house.containsLinks
    isGreatHouse = house.isGreatHouse

    self.currentLord = currentLord
    self.heir = heir
    self.overlordHouse = overlord
    self.foundedByCharacter = founder
    self.cadetBranches = cadetBranches
    self.swornMembers = swornMembers
  }
}
