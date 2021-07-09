//
//  SingleHouseDownloader.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 09.07.21.
//

import Foundation

protocol SingleHouseBasicDownloaderProtocol {
  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> ()
  )
}

class SingleHouseBasicDownloader: SingleHouseBasicDownloaderProtocol {
  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> ()
  ) {
    return Api.getSingleHouse(id: id, completion: completion)
  }
}
