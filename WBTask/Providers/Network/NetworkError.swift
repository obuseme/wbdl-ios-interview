//
//  NetworkError.swift
//  WBTask
//
//  Created by Ugur on 04/09/2021.
//

import Foundation

enum NetworkError: Error {
  case external(Error)
  case serverError
  case invalidResponse
  case invalidData
  case invalidJSON(Error)
  case noConnection

  var description: String {
    switch self {
    case .noConnection:
      return "No internet connection"
    default:
      return "Something went wrong"
    }
  }
}
