//
//  SingleHouseBasicDownloader.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 09.07.21.
//

class SingleHouseBasicDownloader: SingleHouseBasicDownloaderProtocol {
  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> ()
  ) {
    return Api.getSingleHouse(id: id, completion: completion)
  }
}
