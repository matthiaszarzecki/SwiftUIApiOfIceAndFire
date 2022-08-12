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
class Api {
  static let shared = Api()
  private let urlCreator = URLCreator()

  /// Gets 30 ASOIAF Houses.
  func getHouses(
    page: Int,
    pageSize: Int
  ) -> AnyPublisher<[HouseBasic], Error>? {
    guard
      let url = urlCreator.getHousesURL(page: page, pageSize: pageSize)
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
          print($0.data.jsonStringFromData)
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

  func getSingleHouse(
    id: Int,
    completion: @escaping (Result<HouseBasic, NetworkError>) -> Void
  ) {
    fetch(
      HouseBasic.self,
      url: urlCreator.getSingleHouseURL(id: id)
    ) { result in
      completion(result)
    }
  }

  /// Does a GET-call to the specified URL
  /// and returns the type in a completion.
  func fetch<T: Codable>(
    _ for: T.Type = T.self,
    url: URL?,
    completion: @escaping (Result<T, NetworkError>) -> Void
  ) {
    guard let url = url else {
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = RequestMethod.get

    URLSession.shared.dataTask(with: request) { data, response, _ in
      // When the response is not a code 200 (success), return an error.
      if response.isSuccesful {
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
      } else {
        DispatchQueue.main.async {
          completion(.failure(.requestFailed))
        }
      }
    }
    .resume()
  }

  /// Does a GET-call to the specified String-URL
  /// and returns the type in a completion.
  func fetch<T: Codable>(
    _ for: T.Type = T.self,
    url: String,
    completion: @escaping (Result<T, NetworkError>) -> Void
  ) {
    guard let url = URL(string: url) else {
      return
    }

    fetch(
      T.self,
      url: url
    ) { result in
      completion(result)
    }
  }
}
