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
  
  public static func getHouses(
    completion: @escaping ([House]) -> ()
  ) {
    guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=\(pageSize)") else {
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
