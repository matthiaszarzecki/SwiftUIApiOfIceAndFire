//
//  SingleHouseDownloader.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 09.07.21.
//

protocol SingleHouseBasicDownloaderProtocol {
  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> Void
  )
}
