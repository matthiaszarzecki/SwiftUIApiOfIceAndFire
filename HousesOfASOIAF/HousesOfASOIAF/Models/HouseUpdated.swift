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
  let id: String
  let name: String
  let region: String
  let coatOfArms: String
  let motto: String
  let titles: [String]
  let seats: [String]
  let foundingPeriod: String
  let diedOutPeriod: String
  let ancestralWeapons: [String]
  
  /// The colors mentioned in the Coat of Arms, as SwiftUI Colors
  let heraldryColors: [Color]?
  
  var currentLord: Character?
  var heir: Character?
  var overlordHouse: HouseBasic?
  var foundedByCharacter: Character?
  var cadetBranches: [HouseBasic]?
  var swornMembers: [Character]?
  
  init(
    fromHouse house: HouseBasic,
    currentLord: Character? = nil,
    heir: Character? = nil,
    overlord: HouseBasic? = nil,
    founder: Character? = nil,
    cadetBranches: [HouseBasic]? = nil,
    swornMembers: [Character]? = nil
  ) {
    id = house.id
    name = house.name
    region = house.region
    coatOfArms = house.coatOfArms
    motto = house.motto
    titles = house.titles
    seats = house.seats
    foundingPeriod = house.foundingPeriod
    diedOutPeriod = house.diedOutPeriod
    ancestralWeapons = house.ancestralWeapons
    
    self.currentLord = currentLord
    self.heir = heir
    self.overlordHouse = overlord
    self.foundedByCharacter = founder
    self.cadetBranches = cadetBranches
    self.swornMembers = swornMembers
    
    self.heraldryColors = ColorParser().getColors(fromString: house.coatOfArms)
  }
}
