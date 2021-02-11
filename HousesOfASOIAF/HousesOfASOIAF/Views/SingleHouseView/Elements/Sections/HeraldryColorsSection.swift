//
//  HeraldryColorsSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

struct HeraldryColorsSection: View {
  var house: HouseUpdated
  
  var body: some View {
    if let colors = house.heraldryColors, !colors.isEmpty {
      Section(header: SectionHeader(text: "Heraldry Colors")) {
        HStack {
          ForEach(colors, id: \.self) { color in
            Rectangle()
              .frame(width: 35, height: 35, alignment: .center)
              .foregroundColor(color)
              .cornerRadius(12.0)
          }
        }
      }
    }
  }
}

struct HeraldryColorsSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HeraldryColorsSection(house: MockClasses.houseUpdatedWithLinks)
    }
  }
}
