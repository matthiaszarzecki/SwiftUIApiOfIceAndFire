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
  
  /// Gets 30 ASOIAF Houses
  static func getHouses(page: Int) -> AnyPublisher<[HouseBasic], Error> {
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
          [HouseBasic].self,
          from: $0.data
        )
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  /// Does a get-call to the specified URL and return the type in a completion.
  static func fetch<T: Codable>(
    _ for: T.Type = T.self,
    url: String,
    completion: @escaping (T) -> ()
  ) {
    guard let url = URL(string: url) else {
      return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { (data, _, _) in
      let result = try! JSONDecoder().decode(T.self, from: data!)
      DispatchQueue.main.async {
        completion(result)
      }
    }
    .resume()
  }
}