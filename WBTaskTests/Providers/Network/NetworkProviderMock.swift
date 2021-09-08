//
//  NetworkProviderMock.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import Foundation
@testable import WBTask

// swiftlint:disable force_unwrapping
// swiftlint:disable force_cast
final class NetworkProviderMock: NetworkProviderProtocol {

  private let randomURL = URL(string: "https://www.apple.com")!

  var forceFail = false
  var forcedError: NetworkError?
  var responseObject: Decodable?

  func performRequest<T>(_ request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {

    guard forceFail == false else {
      return completion(.failure(forcedError!))
    }
    return completion(.success(responseObject as! T))
  }
}
