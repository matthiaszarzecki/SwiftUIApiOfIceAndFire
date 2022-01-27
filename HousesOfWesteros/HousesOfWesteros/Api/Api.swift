//
//  Api.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 18.01.21.
//

import Combine
import Foundation

/// Contains functions to request and
/// receive data from the ApiOfIceAndFire.
enum Api {
  /// The number of houses that are
  /// requested in a single call.
  static let pageSize = 30

  /// Gets 30 ASOIAF Houses.
  static func getHouses(
    page: Int
  ) -> AnyPublisher<[HouseBasic], Error>? {
    guard
      let url = URL(
        string: "https://www.anapioficeandfire.com/api/houses?page=\(page)&pageSize=\(pageSize)"
      )
    else {
      return nil
    }

    var request = URLRequest(url: url)
    request.httpMethod = RequestMethod.get

    return URLSession.shared
      .dataTaskPublisher(for: request)
      .handleEvents(
        receiveSubscription: nil,
        receiveOutput: {
          $0.data.printJsonFromData()
        },
        receiveCompletion: nil,
        receiveCancel: nil,
        receiveRequest: nil
      )
      .tryMap {
        try JSONDecoder().decode(
          [HouseBasic].self,
          from: $0.data
        )
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  static func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> Void
  ) {
    fetch(
      HouseBasic.self,
      url: "https://anapioficeandfire.com/api/houses/\(id)"
    ) { result in
      completion(result)
    }
  }

  /// Does a GET-call to the specified URL
  /// and returns the type in a completion.
  static func fetch<T: Codable>(
    _ for: T.Type = T.self,
    url: String,
    completion: @escaping (Result<T, NetworkError>) -> Void
  ) {
    guard let url = URL(string: url) else {
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = RequestMethod.get

    URLSession.shared.dataTask(with: request) { data, response, _ in
      // When the response is not a code 200 (success), return an error.
      if response.statusCode != 200 {
        DispatchQueue.main.async {
          completion(.failure(.requestFailed))
        }
      } else {
        // Try to unwrap the received data, return it on success.
        if let unwrappedData = data,
          let result = try? JSONDecoder().decode(T.self, from: unwrappedData) {
          // Call succesful. Proceed with decoding the json-response.
          DispatchQueue.main.async {
            completion(.success(result))
          }
        } else {
          DispatchQueue.main.async {
            completion(.failure(.parsingFailed))
          }
        }
      }
    }
    .resume()
  }
}
