//
//  HeraldryColorsSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

struct HeraldryColorsSection: View {
  let house: HouseUpdated
  let width: CGFloat

  var body: some View {
    if house.heraldryColors.hasEntries {
      Section(header: SectionHeader(text: "Heraldry Colors")) {
        HStack {
          let estimatedPadding: CGFloat = .spacing38 * 2
          let colorWidth = (width - estimatedPadding) / CGFloat(house.heraldryColors.count)

          ForEach(house.heraldryColors, id: \.self) { color in
            Rectangle()
              .frame(width: colorWidth, height: 32, alignment: .center)
              .foregroundColor(color)
              .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
          }
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity,
          alignment: .center
        )
      }
    }
  }
}

#if !TESTING
struct HeraldryColorsSection_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      HeraldryColorsSection(
        house: .houseUpdatedWithLinks,
        width: PreviewConstants.width
      )
    }
  }
}
#endif
