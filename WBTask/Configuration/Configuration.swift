//
//  Configuration.swift
//  WBTask
//
//  Created by Ugur on 04/09/2021.
//

import Foundation

enum Configuration {

  static func value<T>(for key: String) -> T where T: LosslessStringConvertible {
    guard let object = Bundle.main.infoDictionary?[key] else {
      fatalError("Missing configuration key: \(key)")
    }

    switch object {
    case let value as T:
      return value
    case let string as String:
      guard let value = T(string) else { fallthrough }
      return value
    default:
      fatalError("Invalid configuration value")
    }
  }
}

extension Configuration {
  static let baseURL: String = Configuration.value(for: "BaseURL")
  static let publicKey: String = Configuration.value(for: "PublicKey")
  static let privateKey: String = Configuration.value(for: "PrivateKey")
}
