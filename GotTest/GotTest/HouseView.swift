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
        
      }
    }
  }
  
  var coatOfArms: some View {
    return VStack {
      if !house.coatOfArms.isEmpty {
        Text("Coat of Arms:")
          .font(.headline)
        Text("\(house.coatOfArms)")
      }
    }
  }
  
  var houseMotto: some View {
    return VStack {
      if !house.words.isEmpty {
        Text("Words:")
          .font(.headline)
        Text("\(house.words)")
      }
    }
  }
  
  var titles: some View {
    return VStack {
      if house.titles.count > 0 {
        Text("Titles:")
          .font(.headline)
        ForEach(house.titles, id: \.self) { title in
          Text("\(title)")
        }
      }
    }
  }
  
  var seats: some View {
    return VStack {
      if house.seats.count > 0 {
        Text("Seats:")
          .font(.headline)
        ForEach(house.seats, id: \.self) { seat in
          Text("\(seat)")
        }
      }
    }
  }
  
  var currentLord: some View {
    return VStack {
      if !house.currentLord.isEmpty {
        Text("Current Lord:")
          .font(.headline)
        Text("\(house.currentLord)")
      }
    }
  }
  
  var overLord: some View {
    return VStack {
      if !house.overlord.isEmpty {
        Text("Overlord:")
          .font(.headline)
        Text("\(house.overlord)")
      }
    }
  }
  
  var founded: some View {
    return VStack {
      if !house.founded.isEmpty {
        Text("Founded:")
          .font(.headline)
        Text("\(house.founded)")
      }
    }
  }
  
  var body: some View {
    return
      ScrollView {
        title
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        
        coatOfArms
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        
        houseMotto
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        
        titles
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        
        seats
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        
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
