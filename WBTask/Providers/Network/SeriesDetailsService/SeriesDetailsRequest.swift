//
//  SeriesDetailsRequest.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

enum SeriesDetailsRequest: NetworkRequest {
  case characters(id: Int)
  case comics(id: Int)

  var path: String {
    switch self {
    case .characters(let id):
      return "series/\(id)/characters"
    case .comics(let id):
      return "series/\(id)/comics"
    }
  }

  var method: HTTPMethod {
    return .get
  }
}
