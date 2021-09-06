//
//  HomeComicsRequest.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

enum HomeComicsRequest: NetworkRequest {
  case comics

  var path: String {
    return "comics"
  }

  var method: HTTPMethod {
    return .get
  }
}
