//
//  HomeSeries.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

struct HomeComics: Codable {
  let data: ComicsResponse
}

// MARK: - DataClass
struct ComicsResponse: Codable {
  let offset, limit, total, count: Int
  let results: [Comics]
}

// MARK: - Result
struct Comics: Codable {
  let id: Int
  let title: String
  let issueNumber: Int
  let thumbnail: Thumbnail
}

// MARK: - DateElement
struct ComicDate: Codable {
  let type: ComicDateType?
  let date: String?
}

enum ComicDateType: String, Codable {
  case onsaleDate
  case focDate
}

// MARK: - Thumbnail
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
