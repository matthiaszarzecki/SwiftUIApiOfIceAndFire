//
//  HeraldryColorsSection.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

struct HeraldryColorsSection: View {
  let colors: [Color]
  let width: CGFloat

  private let textHeraldryColors = "Heraldry Colors"

  var body: some View {
    if colors.hasEntries {
      Section(header: SectionHeader(text: textHeraldryColors)) {
        HStack {
          let estimatedPadding: CGFloat = .spacing38 * 2
          let colorWidth = (width - estimatedPadding) / CGFloat(colors.count)

          ForEach(colors, id: \.self) { color in
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
        colors: .mockHeraldryColors,
        width: .previewWidth
      )
    }
  }
}
#endif
