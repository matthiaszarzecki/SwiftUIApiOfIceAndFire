//
//  HouseView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseView: View {
  var house: House
  
  var title: some View {
    return VStack {
      if !house.name.isEmpty {
        Text("\(house.name)")
          .font(.title)
      }
      
      if !house.region.isEmpty {
        Text("of \(house.region)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var coatOfArms: some View {
    return VStack {
      if !house.coatOfArms.isEmpty {
        Text("Coat of Arms:")
          .font(.headline)
        Text("\(house.coatOfArms)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var houseMotto: some View {
    return VStack {
      if !house.words.isEmpty {
        Text("Words:")
          .font(.headline)
        Text("\(house.words)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var titles: some View {
    return VStack {
      if house.titles.count > 0 {
        VStack {
          Text("Titles:")
            .font(.headline)
          ForEach(house.titles, id: \.self) { title in
            Text("\(title)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var seats: some View {
    return VStack {
      if house.seats.count > 0 {
        VStack {
          Text("Seats:")
            .font(.headline)
          ForEach(house.seats, id: \.self) { seat in
            Text("\(seat)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var currentLord: some View {
    return VStack {
      if !house.currentLord.isEmpty {
        Text("Current Lord:")
          .font(.headline)
        Text("\(house.currentLord)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var overLord: some View {
    return VStack {
      if !house.overlord.isEmpty {
        Text("Overlord:")
          .font(.headline)
        Text("\(house.overlord)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var founded: some View {
    return VStack {
      if !house.founded.isEmpty {
        Text("Founded:")
          .font(.headline)
        Text("\(house.founded)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var founder: some View {
    return VStack {
      if !house.founder.isEmpty {
        Text("Founder:")
          .font(.headline)
        Text("\(house.founder)")
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var diedOut: some View {
    return VStack {
      if !house.diedOut.isEmpty {
        let text = Text("House died out during:").font(.headline) + Text(" \(house.diedOut)")
        
        text
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var ancestralWeapons: some View {
    return VStack {
      if house.ancestralWeapons.count > 0 && house.ancestralWeapons[0] != "" {
        VStack {
          Text("Ancestral Weapons:")
            .font(.headline)
          ForEach(house.ancestralWeapons, id: \.self) { weapon in
            Text("\(weapon)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var cadetBranches: some View {
    return VStack {
      if house.cadetBranches.count > 0 {
        VStack {
          Text("Cadet Branches:")
            .font(.headline)
          ForEach(house.cadetBranches, id: \.self) { branch in
            Text("\(branch)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var swornMembers: some View {
    return VStack {
      if house.swornMembers.count > 0 {
        VStack {
          Text("Sworn Members:")
            .font(.headline)
          ForEach(house.swornMembers, id: \.self) { member in
            Text("\(member)")
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
      }
    }
  }
  
  var body: some View {
    return
      ScrollView {
        Group {
          title
          coatOfArms
          houseMotto
          titles
          seats
        }
        Group {
          currentLord
          overLord
          founded
          founder
          diedOut
          ancestralWeapons
          cadetBranches
          swornMembers
        }
      }
      .padding()
  }
}

struct HouseView_Previews: PreviewProvider {
  static var previews: some View {
    HouseView(house: MockClasses.house)
  }
}
