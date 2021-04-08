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
      HStack {
        SettingsIcon(systemIcon: "square.and.arrow.up")
        Text("Share")
          .foregroundColor(.black)
      }
    }
  }
  
  var appsAndGamesRow: some View {
    Button(action: {
      if let url = URL(string: "itms-apps://apple.com/app/id1394075736") {
        UIApplication.shared.open(url)
      }
    }) {
      HStack {
        SettingsIcon(systemIcon: "square.grid.2x2.fill")
        Text("Our Apps & Games")
          .foregroundColor(.black)
      }
    }
  }
  
  var twitterLink: some View {
    Link(
      destination: URL(string: "https://twitter.com/matthias_code")!
    ) {
      HStack {
        SettingsIcon(systemIcon: "heart.text.square")
        Text("Twitter")
          .foregroundColor(.black)
      }
    }
  }
  
  var githubLink: some View {
    Link(
      destination: URL(string: "https://github.com/matthiaszarzecki")!
    ) {
      HStack {
        SettingsIcon(systemIcon: "heart.text.square")
        Text("Github")
          .foregroundColor(.black)
      }
    }
  }
  
  var youtubeLink: some View {
    Link(
      destination: URL(string: "https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g")!
    ) {
      HStack {
        SettingsIcon(systemIcon: "heart.text.square")
        Text("Youtube")
          .foregroundColor(.black)
      }
    }
  }
  
  var linkedInLink: some View {
    Link(
      destination: URL(string: "https://www.linkedin.com/in/%F0%9F%8D%8F-matthias-zarzecki-b743353b/")!
    ) {
      HStack {
        SettingsIcon(systemIcon: "heart.text.square")
        Text("LinkedIn")
          .foregroundColor(.black)
      }
    }
  }
  
  var developedByLink: some View {
    Link(
      destination: URL(string: "https://twitter.com/matthias_code")!
    ) {
      HStack {
        SettingsIcon(systemIcon: "signature")
        Text("Matthias Zarzecki")
          .foregroundColor(.black)
      }
    }
  }
  
  var appVersion: some View {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    return VStack {
      Text("Houses of Westeros - Version \(appVersion)")
    }
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: SectionHeader(text: "About")) {
          shareRow
          appsAndGamesRow
        }
        
        Section(header: SectionHeader(text: "Follow Us")) {
          twitterLink
          githubLink
          youtubeLink
          linkedInLink
        }
        
        Section(header: SectionHeader(text: "Developed by")) {
          developedByLink
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
