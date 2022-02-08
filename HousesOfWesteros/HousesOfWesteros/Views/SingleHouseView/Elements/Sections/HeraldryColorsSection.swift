//
//  HeraldryColorsSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

struct HeraldryColorsSection: View {
  var house: HouseUpdated
  var width: CGFloat

  var body: some View {
    if house.heraldryColors.hasEntries {
      Section(header: SectionHeader(text: "Heraldry Colors")) {
        HStack {
          let estimatedPadding: CGFloat = 76
          let colorWidth = (width - estimatedPadding) / CGFloat(house.heraldryColors.count)

          ForEach(house.heraldryColors, id: \.self) { color in
            Rectangle()
              .frame(width: colorWidth, height: 32, alignment: .center)
              .foregroundColor(color)
              .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      }
    }
  }
}

#if !DEBUG
struct HeraldryColorsSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HeraldryColorsSection(
        house: MockClasses.houseUpdatedWithLinks,
        width: PreviewConstants.width
      )
    }
  }
}
#endif
