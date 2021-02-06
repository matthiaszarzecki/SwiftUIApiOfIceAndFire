//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

/// Shows information about the specified House.
struct SingleHouseView: View {
  @ObservedObject private var singleHouseViewModel: SingleHouseViewModel
  
  init(houseBasic: HouseBasic) {
    singleHouseViewModel = SingleHouseViewModel(houseBasic: houseBasic)
  }
  
  var body: some View {
    SingleHouseDisplay(houseUpdated: singleHouseViewModel.state.houseUpdated)
  }
}

struct SingleHouseDisplay: View {
  let houseUpdated: HouseUpdated?
  
  var body: some View {
    if let unwrappedHouseUpdated = houseUpdated {
      return AnyView(
        GeometryReader { geometry in
          VStack {
            HouseNameAndTitle(house: unwrappedHouseUpdated)
            //CoatOfArms(house: unwrappedHouseUpdated)
            Form {
              Group {
                
                
                // Coat of Arms
                if !unwrappedHouseUpdated.coatOfArms.isEmpty {
                  Section(header: SectionHeaderView(text: "🚩 Coat of Arms:", icon: "tray.and.arrow.up.fill")) {
                    Text("\(unwrappedHouseUpdated.coatOfArms)")
                  }
                }
                
                // Motto
                if !unwrappedHouseUpdated.words.isEmpty {
                  Section(header: SectionHeaderView(text: "Words", icon: "tray.and.arrow.up.fill")) {
                    Text("\(unwrappedHouseUpdated.words)")
                  }
                }
                
                // Titles
                if unwrappedHouseUpdated.titles.count > 0 && unwrappedHouseUpdated.titles[0] != "" {
                  Section(header: SectionHeaderView(text: "Titles", icon: "tray.and.arrow.up.fill")) {
                    ForEach(unwrappedHouseUpdated.titles, id: \.self) { title in
                      Text("\(title)")
                    }
                  }
                }
                
                // Seats
                if unwrappedHouseUpdated.seats.count > 0 && unwrappedHouseUpdated.seats[0] != "" {
                  Section(header: SectionHeaderView(text: "Seats", icon: "tray.and.arrow.up.fill")) {
                    ForEach(unwrappedHouseUpdated.seats, id: \.self) { seat in
                      Text("🏰 \(seat)")
                    }
                  }
                }
                
                // Current Lord
                if let character = unwrappedHouseUpdated.currentLord {
                  Section(header: SectionHeaderView(text: "Current Lord", icon: "tray.and.arrow.up.fill")) {
                    NavigationLink(destination: CharacterView(character: character)) {
                      Text("👑 \(character.name)")
                    }
                  }
                }
                
                // Current Heir
                if let character = unwrappedHouseUpdated.heir {
                  Section(header: SectionHeaderView(text: "Current Heir", icon: "tray.and.arrow.up.fill")) {
                    
                    NavigationLink(destination: CharacterView(character: character)) {
                      Text("👑 \(character.name)")
                    }
                  }
                }
                
                // Overlord House
                if let overlordHouse = unwrappedHouseUpdated.overlord {
                  Section(header: SectionHeaderView(text: "Overlord", icon: "tray.and.arrow.up.fill")) {
                    NavigationLink(destination: SingleHouseView(houseBasic: overlordHouse)) {
                      Text("🛡️ \(overlordHouse.name)")
                    }
                  }
                }
                
                // Founded
                if !unwrappedHouseUpdated.founded.isEmpty {
                  Section(header: SectionHeaderView(text: "Founded", icon: "tray.and.arrow.up.fill")) {
                    Text("\(unwrappedHouseUpdated.founded)")
                  }
                }
              }
              
              Group {
                // Founder
                if let character = unwrappedHouseUpdated.founder {
                  Section(header: SectionHeaderView(text: "Founded by", icon: "tray.and.arrow.up.fill")) {
                    NavigationLink(destination: CharacterView(character: character)) {
                      Text("👑 \(character.name)")
                    }
                  }
                }
                
                // Died out
                if !unwrappedHouseUpdated.diedOut.isEmpty {
                  Section(header: SectionHeaderView(text: "House died out during", icon: "tray.and.arrow.up.fill")) {
                    Text("\(unwrappedHouseUpdated.diedOut)")
                  }
                }
                
                CadetBranchesSection(house: unwrappedHouseUpdated)
                SwornMembersSection(house: unwrappedHouseUpdated)
                AncestralWeaponsSection(house: unwrappedHouseUpdated)
              }
            }
          }
        }
      )
    } else {
      return AnyView(Text("Loading"))
    }
  }
}

struct SingleHouseDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SingleHouseDisplay(houseUpdated: MockClasses.houseUpdatedWithLinks)
      SingleHouseDisplay(houseUpdated: MockClasses.houseUpdatedWithoutLinks)
      SingleHouseDisplay(houseUpdated: nil)
    }
  }
}
