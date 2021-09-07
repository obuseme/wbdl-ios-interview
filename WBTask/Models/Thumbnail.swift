//
//  Thumbnail.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

struct Thumbnail: Codable {
  let path: String
  let type: String

  enum CodingKeys: String, CodingKey {
    case path
    case type = "extension"
  }
}

extension Thumbnail {
  var url: URL? {
    let urlString = [path + "/portrait_xlarge." + type].joined()
    return URL(string: urlString)
  }
}
