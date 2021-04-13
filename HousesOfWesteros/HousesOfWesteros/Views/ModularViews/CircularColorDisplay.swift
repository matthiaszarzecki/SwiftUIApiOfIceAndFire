//
//  PieChart.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 11.02.21.
//

import SwiftUI

/// Creates a pie chart from the entered colors,
/// where each segment has the same size.
struct CircularColorDisplay: View {
  var colors: [Color]
  var size: CGFloat
  
  /// The amount each segment will take up.
  private var degreesForEachElement: Double {
    360.0 / Double(colors.count)
  }
  
  var body: some View {
    ZStack {
      ForEach(0..<colors.count) { index in
        let rotation = getRotationAngleForElement(withIndex: index)
        
        Path { path in
          let center: CGPoint = .init(x: size / 2, y: size / 2)
          path.move(to: .init(x: center.x, y: center.y))
          
          path.addArc(
            center: center,
            radius: center.x - 0.05 * center.x,
            startAngle: .degrees(0),
            endAngle: .degrees(degreesForEachElement),
            clockwise: false
          )
        }
        .fill(colors[index])
        .rotationEffect(
          .degrees(rotation),
          anchor: UnitPoint(x: 0.5, y: 0.5)
        )
      }
    }
    .frame(width: size, height: size, alignment: .center)
  }
  
  /// Gets the amount an elements needs to be rotated
  /// to align with the other circle elements. Returns
  /// 0.0 when it is the first element.
  private func getRotationAngleForElement(withIndex index: Int) -> Double {
    if index == 0 {
      return 0.0
    } else {
      return Double(index) * degreesForEachElement
    }
  }
}

struct CircularColorDisplay_Previews: PreviewProvider {
  static var previews: some View {
    CircularColorDisplay(colors: [.red, .green, .blue], size: 100)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
