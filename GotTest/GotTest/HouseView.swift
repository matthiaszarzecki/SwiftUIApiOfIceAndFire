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
  
  var body: some View {
    return
      ScrollView {
        title
        coatOfArms
        houseMotto
        titles
        seats
        currentLord
        overLord
        founded
      }
      .padding()
  }
}

struct HouseView_Previews: PreviewProvider {
  static var previews: some View {
    HouseView(house: MockClasses.house)
  }
}
