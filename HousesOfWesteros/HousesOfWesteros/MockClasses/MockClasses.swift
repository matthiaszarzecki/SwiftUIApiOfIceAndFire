//
//  MockClasses.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Foundation

struct MockClasses {
  static let characterLink = "https://www.anapioficeandfire.com/api/characters/298"
  static let houseLink = "https://www.anapioficeandfire.com/api/houses/285"
  
  static let houseName = "House Allyrion of Godsgrace"
  static let houseRegion = "Dorne"
  static let coatOfArms = "Gyronny Gules and Sable, a hand couped Or"
  static let motto = "No Foe May Pass"
  static let titles = [
    "King of Mountain and Vale (formerly)",
    "Lord of the Eyrie",
    "Defender of the Vale",
    "Warden of the East"
  ]
  static let seats = [
    "Godsgrace",
    "Gates of the Moon (winter)"
  ]
  static let foundingPeriod = "Coming of the Andals"
  static let diedOutPeriod = "260 AC"
  static let ancestralWeapons = [
    "Blackfyre",
    "Whitefyre"
  ]
  
  static let houseBasicWithLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/290",
    name: houseName,
    region: houseRegion,
    coatOfArms: coatOfArms,
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: characterLink,
    heir: characterLink,
    overlordHouse: houseLink,
    foundedByCharacter: characterLink,
    cadetBranches: Array.init(repeating: houseLink, count: 2),
    swornMembers: Array.init(repeating: characterLink, count: 4)
  )
  
  static let houseBasicWithLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/291",
    name: houseName,
    region: houseRegion,
    coatOfArms: "",
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: characterLink,
    heir: characterLink,
    overlordHouse: houseLink,
    foundedByCharacter: characterLink,
    cadetBranches: Array.init(repeating: houseLink, count: 2),
    swornMembers: Array.init(repeating: characterLink, count: 4)
  )
  
  static let houseBasicWithoutLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/292",
    name: houseName,
    region: houseRegion,
    coatOfArms: coatOfArms,
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )
  
  static let houseBasicWithoutLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/293",
    name: houseName,
    region: houseRegion,
    coatOfArms: "",
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )
  
  static let housesBasic = [
    houseBasicWithLinksAndWithCoatOfArms,
    houseBasicWithLinksAndWithoutCoatOfArms,
    houseBasicWithoutLinksAndWithCoatOfArms,
    houseBasicWithoutLinksAndWithoutCoatOfArms
  ]
  
  static let character = CharacterBasic(
    id: "https://www.anapioficeandfire.com/api/characters/290",
    name: "Delonne Allyrion",
    culture: "Northmen",
    born: "In 283 AC",
    died: "In 372 AC",
    titles: ["Lord Commander of the Night's Watch"],
    aliases: [
      "Lord Snow",
      "Ned Stark's Bastard",
      "The Snow of Winterfell",
      "The Crow-Come-Over",
      "The 998th Lord Commander of the Night's Watch"
    ],
    tvShowAppearances: [
      "Season 1",
      "Season 2",
      "Season 3",
      "Season 4",
      "Season 5",
      "Season 6"
    ],
    portrayedBy: ["Kit Harington"],
    father: "https://www.anapioficeandfire.com/api/characters/836",
    mother: "https://www.anapioficeandfire.com/api/characters/112",
    spouse: "https://www.anapioficeandfire.com/api/characters/66",
    allegiances: ["https://anapioficeandfire.com/api/houses/362"],
    bookAppearances: ["https://anapioficeandfire.com/api/books/5"],
    hasPointOfViewChaptersInBooks: [
      "https://anapioficeandfire.com/api/books/1",
      "https://anapioficeandfire.com/api/books/2",
      "https://anapioficeandfire.com/api/books/3",
      "https://anapioficeandfire.com/api/books/8"
    ]
  )
  
  static let characters = Array.init(repeating: character, count: 3)
  
  static let houseUpdatedWithLinks = HouseUpdated(
    fromHouse: houseBasicWithLinksAndWithCoatOfArms,
    currentLord: character,
    heir: character,
    overlord: houseBasicWithLinksAndWithCoatOfArms,
    founder: character,
    cadetBranches: housesBasic,
    swornMembers: characters
  )
  
  static let houseUpdatedWithoutLinks = HouseUpdated(
    fromHouse: houseBasicWithoutLinksAndWithCoatOfArms
  )
}
