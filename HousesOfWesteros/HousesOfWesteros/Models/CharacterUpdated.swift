//
//  CharacterUpdated.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 02.03.21.
//

import Foundation
import SwiftUI

/// The character-data but with the URL's called
/// and replaced by their corresponding data.
struct CharacterUpdated {
  let id: String
  let name: String
  let culture: String
  let born: String
  let died: String
  let titles: [String]
  let aliases: [String]
  let tvShowAppearances: [String]
  let portrayedBy: [String]
  
  init(
    fromCharacter character: CharacterBasic
  ) {
    id = character.id
    name = character.name
    culture = character.culture
    born = character.born
    died = character.died
    titles = character.titles
    aliases = character.aliases
    tvShowAppearances = character.tvShowAppearances
    portrayedBy = character.portrayedBy
  }
}
