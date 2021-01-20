//
//  MockClasses.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

struct MockClasses {
  static let houseBasicWithLinks = HouseBasic(
    id: "https://www.anapioficeandfire.com/api/house/298",
    name: "House Allyrion of Godsgrace",
    region: "Dorne",
    coatOfArms: "Gyronny Gules and Sable, a hand couped Or",
    words: "No Foe May Pass",
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
    currentLord: "https://www.anapioficeandfire.com/api/characters/298",
    heir: "https://www.anapioficeandfire.com/api/characters/1922",
    overlord: "https://www.anapioficeandfire.com/api/houses/285",
    founded: "Coming of the Andals",
    founder: "https://www.anapioficeandfire.com/api/characters/144",
    diedOut: "260 AC",
    ancestralWeapons: ["Blackfyre", "Whitefyre"],
    cadetBranches: ["https://www.anapioficeandfire.com/api/houses/6"],
    swornMembers: [
      "https://www.anapioficeandfire.com/api/characters/298",
      "https://www.anapioficeandfire.com/api/characters/1129",
      "https://www.anapioficeandfire.com/api/characters/1301",
      "https://www.anapioficeandfire.com/api/characters/1922"
    ]
  )
  
  static let houseBasicWithoutLinks = HouseBasic(
    id: "https://www.anapioficeandfire.com/api/house/298",
    name: "House Allyrion of Godsgrace",
    region: "Dorne",
    coatOfArms: "Gyronny Gules and Sable, a hand couped Or",
    words: "No Foe May Pass",
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
    overlord: "",
    founded: "",
    founder: "",
    diedOut: "260 AC",
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
