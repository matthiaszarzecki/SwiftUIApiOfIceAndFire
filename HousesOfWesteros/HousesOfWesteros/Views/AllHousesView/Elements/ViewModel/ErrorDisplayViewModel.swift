//
//  ErrorDisplayViewModel.swift
//  HousesOfWesteros
//
//  Created by Matthias Zarzecki on 06.09.22.
//

struct ErrorDisplayViewModel {
  var reloadData: () -> Void

  let textTitle = "Oh No!"
  let textExplanation = "Something went wrong fetching the data. Click here to try again!"
}

extension ErrorDisplayViewModel {
  static let mockErrorDisplayViewModel: ErrorDisplayViewModel = .init {}
}
