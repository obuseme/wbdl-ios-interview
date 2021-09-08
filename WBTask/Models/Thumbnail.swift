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
  enum Size: String {
    case portrait = "portrait_xlarge"
    case landscape = "landscape_incredible"
  }

  func getURL(with size: Size) -> URL? {
    let urlString = [path + "/" + size.rawValue + "." + type].joined()
    return URL(string: urlString)
  }
}
