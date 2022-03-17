//
//  MockSingleHouseBasicDownloader.swift
//  HousesOfWesterosTests
//
//  Created by Matthias Zarzecki on 09.07.21.
//

import Foundation
@testable import HousesOfWesteros

class MockSingleHouseBasicDownloader: SingleHouseBasicDownloaderProtocol {
  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> Void
  ) {
    completion(.success(HouseBasic.mockHouseBasicWithLinksAndWithCoatOfArms))
  }
}
