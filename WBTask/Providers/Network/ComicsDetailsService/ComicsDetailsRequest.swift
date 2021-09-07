//
//  ComicsDetailsRequest.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

enum ComicsDetailsRequest: NetworkRequest {
  case characters(id: Int)
  case books(id: Int)

  var path: String {
    switch self {
    case .characters(let id):
      return "\(id)/characters"
    case .books(let id):
      return "\(id)/books"
    }
  }

  var method: HTTPMethod {
    return .get
  }
}
