//
//  Api.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import Foundation

enum Api {
  static let pageSize = 30
  
  static func getHouses(page: Int) -> AnyPublisher<[House], Error> {
    let url = URL(string: "https://www.anapioficeandfire.com/api/houses?page=\(page)&pageSize=\(pageSize)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    return URLSession.shared
     .dataTaskPublisher(for: request)
      .handleEvents(
        receiveOutput: {
          print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!)
        }
      )
      .tryMap {
        return try JSONDecoder().decode(
          [House].self,
          from: $0.data
        )
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}