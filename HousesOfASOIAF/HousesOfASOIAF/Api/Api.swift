//
//  Api.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import Foundation

/// Contains functions to request and receive data from the ApiOfIceAndFire.
struct Api {
  /// The number of houses that are requested in a single call.
  static let pageSize = 30
  
  /// Gets 30 ASOIAF Houses.
  static func getHouses(page: Int) -> AnyPublisher<[HouseBasic], Error> {
    let url = URL(string: "https://www.anapioficeandfire.com/api/houses?page=\(page)&pageSize=\(pageSize)")!
    var request = URLRequest(url: url)
    request.httpMethod = RequestMethod.get.rawValue

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

  /// Does a GET-call to the specified URL and returns the type in a completion.
  static func fetch<T: Codable>(
    _ for: T.Type = T.self,
    url: String,
    completion: @escaping (Result<T, NetworkError>) -> ()
  ) {
    guard let url = URL(string: url) else {
      return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = RequestMethod.get.rawValue
    
    URLSession.shared.dataTask(with: request) { (data, response, _) in
      // When the response is not a code 200 (success), return an error.
      if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode != 200 {
          completion(.failure(.requestFailed))
        }
      }
      
      // Call succesful. Proceed with decoding the json-response.
      let result = try! JSONDecoder().decode(T.self, from: data!)
      DispatchQueue.main.async {
        completion(.success(result))
      }
    }
    .resume()
  }
}

enum NetworkError: Error {
  case badUrl
  case requestFailed
  case unknown
}
