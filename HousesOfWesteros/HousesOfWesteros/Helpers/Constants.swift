//
//  Constants.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 18.04.21.
//

import Foundation
import SwiftUI

struct Constants {
  /// The Ids of the 9 great houses:
  ///   7 - Arryn of the Eyrie
  ///  17 - Baratheon of Storm's End
  /// 169 - Greyjoy of Pyke
  /// 229 - Lannister of Casterly Rock
  /// 285 - Martell of Sunspear
  /// 362 - Stark of Winterfell
  /// 378 - Targaryen of King's Landing
  /// 395 - Tully of Riverrun
  /// 398 - Tyrell of Highgarden
  static let greatHouses = [7, 17, 169, 229, 285, 362, 378, 395, 398]
  
  /// Returns a lighter version of the
  /// major color of a great houses sigil
  /// for use as background-color.
  static func greatHousesMajorColor(id: Int) -> Color {
    switch(id) {
    case 7:
      return Color(hex: "A8C0DC")
    case 17:
      return Color(hex: "EBE1A7")
    case 169:
      return Color(hex: "F5E6AA")
    case 229:
      return Color(hex: "D49995")
    case 285:
      return Color(hex: "E4C3A1")
    case 362:
      return Color(hex: "F0F0F0")
    case 378:
      return Color(hex: "DEADA9")
    case 395:
      return Color(hex: "9C9BD6")
    case 398:
      return Color(hex: "A8C998")
    default:
      return .white
    }
  }
}
