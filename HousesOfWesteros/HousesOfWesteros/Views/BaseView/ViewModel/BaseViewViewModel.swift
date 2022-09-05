//
//  BaseViewViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 05.09.22.
//

import Foundation
import SwiftUI

struct BaseViewViewModel {
  let textGreatHouses = "Great Houses"
  let textAllHouses = "All Houses"
  let textAbout = "About"

  func setupCustomFonts() {
    // Set font for Title in large view
    if let font = UIFont(name: "GameofThrones", size: 20) {
      UINavigationBar.appearance().largeTitleTextAttributes = [.font: font]
    }

    // Set font for Title in navigation bar
    if let font = UIFont(name: "GameofThrones", size: 16) {
      UINavigationBar.appearance().titleTextAttributes = [.font: font]
    }
  }
}
