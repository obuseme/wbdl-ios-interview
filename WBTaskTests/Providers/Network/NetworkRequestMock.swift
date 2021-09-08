//
//  NetworkRequestMock.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import Foundation
@testable import WBTask

enum NetworkRequestMock: NetworkRequest {
  case test

  var path: String {
    return "test/path"
  }

  var method: HTTPMethod {
    return .get
  }

  var parameters: RequestParameters {
    return .url(["test": "parameters"])
  }
}
