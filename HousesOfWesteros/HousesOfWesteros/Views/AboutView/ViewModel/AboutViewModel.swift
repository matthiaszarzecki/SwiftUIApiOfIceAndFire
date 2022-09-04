//
//  AboutViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 05.09.22.
//

import Foundation
import SwiftUI

struct AboutViewModel {
  let textMoreApps = "More Apps"
  let textGithub = "Github"
  let textShare = "Share"
  let textMoreAppsAndGames = "More Apps & Games"
  let textTwitter = "Twitter"
  let textYoutube = "Youtube"
  let textLinkedIn = "LinkedIn"
  let textMatthiasZarzecki = "Matthias Zarzecki"
  let textTheApiOfIceAndFire = "The Api of Ice and Fire"
  let textAbout = "About"
  let textFollowUs = "Follow Us"
  let textDevelopedBy = "Developed By"
  let textBasedOn = "Based On"

  let urlGitHub = "https://github.com/matthiaszarzecki"
  let urlYoutube = "https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g"
  let urlLinkedIn = "https://www.linkedin.com/in/%F0%9F%8D%8F-matthias-zarzecki-b743353b/"
  let urlTwitter = "https://twitter.com/matthias_code"
  let urlApiOfIceAndFire = "https://anapioficeandfire.com/"

  private let urlBasketballApp = "itms-apps://apple.com/app/id1597533063"
  private let urlGithubProject = "https://github.com/matthiaszarzecki/SwiftUIApiOfIceAndFire"

  var textAppVersion: String {
    "Houses of Westeros - Version \(Bundle.appVersion)"
  }

  var isSimulator: Bool {
    Device.isSimulator
  }

  func shareApp() {
    guard let data = URL(
      string: urlGithubProject
    ) else {
      return
    }

    let viewController = UIActivityViewController(
      activityItems: [data],
      applicationActivities: nil
    )
    UIApplication.shared.currentUIWindow()?.rootViewController?.present(
      viewController,
      animated: true,
      completion: nil
    )
  }

  func openBasketballAppOnAppstore() {
    if let url = URL(
      string: urlBasketballApp
    ) {
      UIApplication.shared.open(url)
    }
  }
}
