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
  
  /*static func searchHouses(query: String, page: Int) -> AnyPublisher<[HouseResult], Error> {
    let url = URL(string: "https://anapioficeandfire.com/api/houses")!
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
          [HouseResult].self,
          from: $0.data
        )
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }*/
  
  public static func getHouses(
    completion: @escaping ([House]) -> ()
  ) {
    guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=30") else {
      return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { (data, _, _) in
      let houses = try! JSONDecoder().decode([House].self, from: data!)
      DispatchQueue.main.async {
        completion(houses)
      }
    }
    .resume()
  }
}
