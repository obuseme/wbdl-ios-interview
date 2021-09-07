//
//  ComicsDetailsRequest.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

enum ComicsDetailsRequest: NetworkRequest {
  case comics

  var path: String {
    return "comics"
  }

  var method: HTTPMethod {
    return .get
  }
}
