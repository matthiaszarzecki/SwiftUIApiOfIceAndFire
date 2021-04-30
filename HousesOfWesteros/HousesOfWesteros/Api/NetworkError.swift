//
//  NetworkError.swift
//  HousesOfASOIAF
//
//  Created by Matthias Zarzecki on 28.02.21.
//

import Foundation

enum NetworkError: Error {
  case badUrl
  case requestFailed
  case parsingFailed
  case unknown
}
