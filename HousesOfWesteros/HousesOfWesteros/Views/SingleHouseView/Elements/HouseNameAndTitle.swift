//
//  Title.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import SwiftUI

struct HouseNameAndTitle: View {
  var house: HouseUpdated
  var width: CGFloat
  
  var body: some View {
    return VStack {
      let isGreatHouse = house.isGreatHouse
      let adaptedWidth = isGreatHouse ? width - 72 : width
      
      HStack {
        if isGreatHouse {
          HouseIconSigil(iconSize: .largeForHeader, id: house.id)
        }
        
        if house.name.exists {
          Text("\(house.name)")
            .font(.system(size: 200))
            .minimumScaleFactor(0.08)
            .multilineTextAlignment(.center)
            .frame(width: adaptedWidth, height: 40, alignment: .center)
        }
      }
      
      if house.region.exists {
        Text("of \(house.region)")
          // Move this up to be directly
          // underneath the text in the HStack
          .offset(y: -8)
          .padding(.bottom, 16)
      }
    }
    .padding(.top, 24)
    
    // In order for this to look good on the view above
    // on top of a Form this needs to be super-small and
    // offset to the top.
    .frame(width: width, height: 34, alignment: .center)
    
    // Move everything upwards to counter the
    // auto-padding in a NavigationView.
    .offset(y: -20)
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    HouseNameAndTitle(
      house: MockClasses.houseUpdatedWithLinks,
      width: PreviewConstants.width
    )
    .offset(y: 50)
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
