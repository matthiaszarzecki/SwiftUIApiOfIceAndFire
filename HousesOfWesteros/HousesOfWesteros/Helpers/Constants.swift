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
  /// 378 - Targaryen of King's Landing
  /// 362 - Stark of Winterfell
  /// 229 - Lannister of Casterly Rock
  ///   7 - Arryn of the Eyrie
  /// 395 - Tully of Riverrun
  /// 169 - Greyjoy of Pyke
  ///  17 - Baratheon of Storm's End
  /// 398 - Tyrell of Highgarden
  /// 285 - Martell of Sunspear
  static let greatHouses = [7, 17, 169, 229, 285, 362, 378, 395, 398]
  
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
      return Color(hex: "A07774")
    case 395:
      return Color(hex: "7F7EB1")
    case 398:
      return Color(hex: "6F8D67")
    default:
      return .white
    }
  }
}
