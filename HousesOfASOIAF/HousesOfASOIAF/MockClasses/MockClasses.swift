//
//  MockClasses.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

struct MockClasses {
  static let characterLink = "https://www.anapioficeandfire.com/api/characters/298"
  static let houseName = "House Allyrion of Godsgrace"
  
  static let houseBasicWithLinks = HouseBasic(
    id: "https://www.anapioficeandfire.com/api/house/298",
    name: MockClasses.houseName,
    region: "Dorne",
    coatOfArms: "Gyronny Gules and Sable, a hand couped Or",
    motto: "No Foe May Pass",
    titles: [
      "King of Mountain and Vale (formerly)",
      "Lord of the Eyrie",
      "Defender of the Vale",
      "Warden of the East"
    ],
    seats: [
      "Godsgrace",
      "Gates of the Moon (winter)"
    ],
    currentLord: MockClasses.characterLink,
    heir: MockClasses.characterLink,
    overlordHouse: "https://www.anapioficeandfire.com/api/houses/285",
    foundingPeriod: "Coming of the Andals",
    foundedByCharacter: "https://www.anapioficeandfire.com/api/characters/144",
    diedOutPeriod: "260 AC",
    ancestralWeapons: ["Blackfyre", "Whitefyre"],
    cadetBranches: ["https://www.anapioficeandfire.com/api/houses/6"],
    swornMembers: Array.init(repeating: MockClasses.characterLink, count: 4)
  )
  
  static let houseBasicWithoutLinks = HouseBasic(
    id: "https://www.anapioficeandfire.com/api/house/298",
    name: MockClasses.houseName,
    region: "Dorne",
    coatOfArms: "Gyronny Gules and Sable, a hand couped Or",
    motto: "No Foe May Pass",
    titles: [
      "King of Mountain and Vale (formerly)",
      "Lord of the Eyrie",
      "Defender of the Vale",
      "Warden of the East"
    ],
    seats: [
      "Godsgrace",
      "Gates of the Moon (winter)"
    ],
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundingPeriod: "",
    foundedByCharacter: "",
    diedOutPeriod: "260 AC",
    ancestralWeapons: ["Blackfyre", "Whitefyre"],
    cadetBranches: [],
    swornMembers: []
  )
  
  static let housesBasic = [
    MockClasses.houseBasicWithLinks,
    MockClasses.houseBasicWithoutLinks,
    MockClasses.houseBasicWithLinks,
    MockClasses.houseBasicWithoutLinks
  ]
  
  static let character = Character(
    url: "https://www.anapioficeandfire.com/api/characters/298",
    name: "Delonne Allyrion"
  )
  
  static let characters = Array.init(repeating: MockClasses.character, count: 3)
  
  static let houseUpdatedWithLinks = HouseUpdated(
    fromHouse: MockClasses.houseBasicWithLinks,
    currentLord: MockClasses.character,
    heir: MockClasses.character,
    overlord: MockClasses.houseBasicWithLinks,
    founder: MockClasses.character,
    cadetBranches: MockClasses.housesBasic,
    swornMembers: MockClasses.characters
  )
  
  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: MockClasses.houseBasicWithoutLinks
  )
}
