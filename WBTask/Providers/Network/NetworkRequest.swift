//
//  NetworkRequest.swift
//  WBTask
//
//  Created by Ugur on 04/09/2021.
//

import Foundation

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case delete = "DELETE"
}

enum RequestParameters {
  case body([String: Any]?)
  case url([String: String]?)
}
protocol NetworkRequest {
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: RequestParameters { get }
  var headers: [String: String]? { get }
}

extension NetworkRequest {
  var parameters: RequestParameters? {
    return nil
  }

  var headers: [String: String]? {
    return nil
  }
}
