//
//  UIApplicationExtension.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 27.08.22.
//

import Foundation
import UIKit

extension UIApplication {
  /// Non-deprecated way of calling currentUIWindow to sidestep
  /// window deprecation warning during sharing-sheet open.
  func currentUIWindow() -> UIWindow? {
    let connectedScenes = UIApplication.shared.connectedScenes
      .filter { $0.activationState == .foregroundActive }
      .compactMap { $0 as? UIWindowScene }

    let window = connectedScenes.first?
      .windows
      .first { $0.isKeyWindow }

    return window
  }
}
