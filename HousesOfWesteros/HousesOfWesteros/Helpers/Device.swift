//
//  Device.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 26.11.21.
//

import Foundation

class Device {
  static var isSimulator: Bool {
#if targetEnvironment(simulator)
    return true
#else
    return false
#endif
  }
}
