//
//  AllHousesDownloader.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 05.09.22.
//

import Combine
import Foundation

protocol HousesBasicDownloaderProtocol {
  func getHouses(
    page: Int,
    pageSize: Int
  ) -> AnyPublisher<[HouseBasic], Error>?
}

class HousesBasicDownloader: HousesBasicDownloaderProtocol {
  func getHouses(
    page: Int,
    pageSize: Int
  ) -> AnyPublisher<[HouseBasic], Error>? {
    Api.shared.getHouses(page: page, pageSize: pageSize)
  }
}

class MockHousesBasicDownloader: HousesBasicDownloaderProtocol {
  func getHouses(
    page: Int,
    pageSize: Int
  ) -> AnyPublisher<[HouseBasic], Error>? {
    Just(.mockHousesBasic)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
