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
  var appsAndGamesRow: some View {
    let settingsRow = SettingsRow(
      systemIcon: "square.grid.2x2.fill",
      text: "More Apps & Games"
    )

    if Device.isSimulator {
      return AnyView(
        Link(
          destination: URL(string: "https://github.com/matthiaszarzecki")!
        ) {
          settingsRow
        }
      )
    } else {
      return AnyView(
        Button(
          action: {
            if let url = URL(
              string: "itms-apps://apple.com/app/id1394075736"
            ) {
              UIApplication.shared.open(url)
            }
          },
          label: {
            settingsRow
          }
        )
      )
    }
  }
  
  var twitterLink: some View {
    Link(
      destination: URL(string: "https://twitter.com/matthias_code")!
    ) {
      SettingsRow(
        systemIcon: "heart.text.square",
        text: "Twitter"
      )
    }
  }
  
  var githubLink: some View {
    Link(
      destination: URL(string: "https://github.com/matthiaszarzecki")!
    ) {
      SettingsRow(
        systemIcon: "heart.text.square",
        text: "Github"
      )
    }
  }
  
  var youtubeLink: some View {
    Link(
      destination: URL(string: "https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g")!
    ) {
      SettingsRow(
        systemIcon: "heart.text.square",
        text: "Youtube"
      )
    }
  }
  
  var linkedInLink: some View {
    Link(
      destination: URL(string: "https://www.linkedin.com/in/%F0%9F%8D%8F-matthias-zarzecki-b743353b/")!
    ) {
      SettingsRow(
        systemIcon: "heart.text.square",
        text: "LinkedIn"
      )
    }
  }
  
  var developedByLink: some View {
    Link(
      destination: URL(string: "https://twitter.com/matthias_code")!
    ) {
      SettingsRow(
        systemIcon: "signature",
        text: "Matthias Zarzecki"
      )
    }
  }
  
  var apiLink: some View {
    Link(
      destination: URL(string: "https://anapioficeandfire.com/")!
    ) {
      SettingsRow(
        systemIcon: "chevron.left.slash.chevron.right",
        text: "The Api of Ice and Fire"
      )
    }
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

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
