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
      if house.name.exists {
        Text("\(house.name)")
          .font(.system(size: 200))
          .minimumScaleFactor(0.1)
          .frame(width: width, height: 40, alignment: .center)
      }
      
      if house.region.exists {
        Text("of \(house.region)")
          .padding(.bottom, 16)
      }
    }
    
    // In order for this to look good on the view above
    // on top of a Form this needs to be super-small and
    // offset to the top.
    .frame(width: width, height: 10, alignment: .center)
    
    // Move everything upwards to counter the
    // auto-padding in a NavigationView.
    .offset(y: -20)
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      HouseNameAndTitle(
        house: MockClasses.houseUpdatedWithLinks,
        width: geometry.size.width
      )
      
    }
    .previewLayout(.sizeThatFits)
  }
}
