//
//  URLCreator.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 23.03.22.
//

import Foundation

class URLCreator {
  static let shared = URLCreator()

  func getHousesURL(page: Int, pageSize: Int) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "www.anapioficeandfire.com"
    components.path = "/api/houses"
    components.queryItems = [
      URLQueryItem(name: "page", value: "\(page)"),
      URLQueryItem(name: "pageSize", value: "\(pageSize)")
    ]

    return components.url
  }
}
