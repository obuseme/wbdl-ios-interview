//
//  HomeSeriesRequest.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

enum HomeSeriesRequest: NetworkRequest {
  case series

  var path: String {
    return "series"
  }

  var method: HTTPMethod {
    return .get
  }
}
