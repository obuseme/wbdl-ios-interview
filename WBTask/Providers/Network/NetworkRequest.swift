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
  var parameters: RequestParameters {
    return RequestParameters.defaultParameters()
  }

  var headers: [String: String]? {
    return nil
  }
}

extension RequestParameters {

  static func defaultParameters() -> RequestParameters {
    let timestamp = "\(Date().timeIntervalSince1970)"
    let publicKey: String = Configuration.publicKey
    let privateKey: String = Configuration.privateKey

    return .url([
    Keys.timestamp.rawValue: timestamp,
    Keys.apiKey.rawValue: publicKey,
    Keys.hash.rawValue: "\(timestamp)\(privateKey)\(publicKey)".md5()
    ])
  }
}

enum Keys: String {
  case timestamp = "ts"
  case apiKey = "apikey"
  case hash
}
