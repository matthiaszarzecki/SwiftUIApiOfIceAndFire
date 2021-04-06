//
//  AboutView.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 06.04.21.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    NavigationView {
      Form {
        Section(header: SectionHeader(text: "About")) {
          HStack {
            Image(systemName: "square.and.arrow.up")
            Text("Share")
          }
          HStack {
            Image(systemName: "square.grid.2x2.fill")
            Text("Our Apps & Games")
          }
        }
        
        Section(header: SectionHeader(text: "Follow Us")) {
          HStack {
            Image(systemName: "heart.text.square")
            Text("Twitter")
          }
          HStack {
            Image(systemName: "heart.text.square")
            Text("Github")
          }
          HStack {
            Image(systemName: "heart.text.square")
            Text("Youtube")
          }
          HStack {
            Image(systemName: "heart.text.square")
            Text("LinkedIn")
          }
        }
        
        Section(header: SectionHeader(text: "Developed by")) {
          HStack {
            Image(systemName: "signature")
            Text("Matthias Zarzecki")
          }
        }
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        Text("Houses of Westeros")
        Text("Version \(appVersion)")
      }
      .navigationTitle("About")
    }
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
