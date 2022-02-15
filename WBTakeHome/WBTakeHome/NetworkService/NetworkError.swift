//
//  NetworkError.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

enum NetworkError: Error {
  case badURL
  case noData
  case badNetwork
  case badResponse
  case badDecode
}

extension NetworkError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .badNetwork:return "This app requires internet connection to open."
    case .badResponse:return "Response is not successful."
    case .badURL:return "URL is not correct."
    case .noData:return "No data coming back from server."
    case .badDecode: return "Bad data decoding"
    }
  }
  
  var recoverySuggestion: String? {
    switch self {
    case .badNetwork:return "Please check your internet connection."
    case .badResponse:return "Please check your internet connection or come back later."
    case .badURL:return "Please check your internet connection."
    case .noData:return "Please check your internet connection."
    case .badDecode: return "Please come back later."
    }
  }
}
