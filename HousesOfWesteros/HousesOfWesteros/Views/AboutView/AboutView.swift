//
//  AboutView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct AboutView: View {
  var shareRow: some View {
    Button(action: shareApp) {
      SettingsRow(
        systemIcon: "square.and.arrow.up",
        text: "Share"
      )
    }
  }

  /// Button that opens the AppStore, when running on an actual
  /// device. On the simulator this does not work, so we open
  /// a link to a different website instead (appstore-links that
  /// work in a desktop-browser are not allowed on iOS Safari).
  @ViewBuilder
  var appsAndGamesRow: some View {
    if Device.isSimulator {
      LinkSettingsRow(
        systemIcon: "square.grid.2x2.fill",
        text: "More Apps",
        urlString: "https://github.com/matthiaszarzecki"
      )
    } else {
      Button(
        action: {
          if let url = URL(
            string: "itms-apps://apple.com/app/id1394075736"
          ) {
            UIApplication.shared.open(url)
          }
        },
        label: {
          SettingsRow(
            systemIcon: "square.grid.2x2.fill",
            text: "More Apps & Games"
          )
        }
      )
    }
  }

  var twitterLink: some View {
    LinkSettingsRow(
      systemIcon: "number.square",
      text: "Twitter",
      urlString: "https://twitter.com/matthias_code"
    )
  }

  var githubLink: some View {
    LinkSettingsRow(
      systemIcon: "chevron.left.forwardslash.chevron.right",
      text: "Github",
      urlString: "https://github.com/matthiaszarzecki"
    )
  }

  var youtubeLink: some View {
    LinkSettingsRow(
      systemIcon: "film",
      text: "Youtube",
      urlString: "https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g"
    )
  }

  var linkedInLink: some View {
    LinkSettingsRow(
      systemIcon: "doc.richtext",
      text: "LinkedIn",
      urlString: "https://www.linkedin.com/in/%F0%9F%8D%8F-matthias-zarzecki-b743353b/"
    )
  }

  var developedByLink: some View {
    LinkSettingsRow(
      systemIcon: "signature",
      text: "Matthias Zarzecki",
      urlString: "https://twitter.com/matthias_code"
    )
  }

  var apiLink: some View {
    LinkSettingsRow(
      systemIcon: "chevron.left.slash.chevron.right",
      text: "The Api of Ice and Fire",
      urlString: "https://anapioficeandfire.com/"
    )
  }

  var appVersion: some View {
    Text("Houses of Westeros - Version \(Bundle.appVersion)")
      .font(.caption)
  }

  var body: some View {
    NavigationView {
      Form {
        Section(
          header: SectionHeader(text: "About")
        ) {
          shareRow
          appsAndGamesRow
        }

        Section(
          header: SectionHeader(text: "Follow Us")
        ) {
          twitterLink
          githubLink
          youtubeLink
          linkedInLink
        }

        Section(
          header: SectionHeader(text: "Developed by")
        ) {
          developedByLink
        }

        Section(
          header: SectionHeader(text: "Based on")
        ) {
          apiLink
        }

        appVersion
      }
      .navigationTitle("About")
    }
  }

  func shareApp() {
    guard let data = URL(
      string: "https://github.com/matthiaszarzecki/SwiftUIApiOfIceAndFire"
    ) else {
      return
    }

    let viewController = UIActivityViewController(
      activityItems: [data],
      applicationActivities: nil
    )
    UIApplication.shared.windows.first?.rootViewController?.present(
      viewController,
      animated: true,
      completion: nil
    )
  }
}

#if !TESTING
struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
#endif
