//
//  AboutView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct AboutView: View {
  private let viewModel: AboutViewModel
  private let iconForProgramming = "chevron.left.slash.chevron.right"

  private var shareRow: some View {
    Button(
      action: {
        viewModel.shareApp()
      },
      label: {
        SettingsRow(
          systemIcon: "square.and.arrow.up",
          text: viewModel.textShare
        )
      }
    )
  }

  /// Button that opens the AppStore, when running on an actual
  /// device. On the simulator this does not work, so we open
  /// a link to a different website instead (appstore-links that
  /// work in a desktop-browser are not allowed on iOS Safari).
  @ViewBuilder
  private var appsAndGamesRow: some View {
    let iconName = "square.grid.2x2.fill"

    if viewModel.isSimulator {
      LinkSettingsRow(
        systemIcon: iconName,
        text: viewModel.textMoreApps,
        urlString: viewModel.urlGitHub
      )
    } else {
      Button(
        action: {
          viewModel.openBasketballAppOnAppstore()
        },
        label: {
          SettingsRow(
            systemIcon: iconName,
            text: viewModel.textMoreAppsAndGames
          )
        }
      )
    }
  }

  private var twitterLink: some View {
    LinkSettingsRow(
      systemIcon: "number.square",
      text: viewModel.textTwitter,
      urlString: viewModel.urlTwitter
    )
  }

  private var githubLink: some View {
    LinkSettingsRow(
      systemIcon: iconForProgramming,
      text: viewModel.textGithub,
      urlString: viewModel.urlGitHub
    )
  }

  private var youtubeLink: some View {
    LinkSettingsRow(
      systemIcon: "film",
      text: viewModel.textYoutube,
      urlString: viewModel.urlYoutube
    )
  }

  private var linkedInLink: some View {
    LinkSettingsRow(
      systemIcon: "doc.richtext",
      text: viewModel.textLinkedIn,
      urlString: viewModel.urlLinkedIn
    )
  }

  private var developedByLink: some View {
    LinkSettingsRow(
      systemIcon: "signature",
      text: viewModel.textMatthiasZarzecki,
      urlString: viewModel.urlTwitter
    )
  }

  private var apiLink: some View {
    LinkSettingsRow(
      systemIcon: iconForProgramming,
      text: viewModel.textTheApiOfIceAndFire,
      urlString: viewModel.urlApiOfIceAndFire
    )
  }

  private var appVersion: some View {
    Text(viewModel.textAppVersion)
      .font(.caption)
  }

  var body: some View {
    NavigationView {
      Form {
        Section(
          header: SectionHeader(text: viewModel.textAbout)
        ) {
          shareRow
          appsAndGamesRow
        }

        Section(
          header: SectionHeader(text: viewModel.textFollowUs)
        ) {
          twitterLink
          githubLink
          youtubeLink
          linkedInLink
        }

        Section(
          header: SectionHeader(text: viewModel.textDevelopedBy)
        ) {
          developedByLink
        }

        Section(
          header: SectionHeader(text: viewModel.textBasedOn)
        ) {
          apiLink
        }

        appVersion
      }
      .navigationTitle(viewModel.textAbout)
    }
  }

  init(viewModel: AboutViewModel = AboutViewModel()) {
    self.viewModel = viewModel
  }
}

#if !TESTING
struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
#endif
