//
//  HouseUpdated.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import Foundation

/// The house-data but with the URL's called
/// and replaced by their corresponding data.
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
  var overlord: HouseBasic?
  var founder: Character?
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
    words = house.words
    titles = house.titles
    seats = house.seats
    founded = house.foundingPeriod
    diedOut = house.diedOutPeriod
    ancestralWeapons = house.ancestralWeapons
    
    self.currentLord = currentLord
    self.heir = heir
    self.overlord = overlord
    self.founder = founder
    self.cadetBranches = cadetBranches
    self.swornMembers = swornMembers
  }
}
