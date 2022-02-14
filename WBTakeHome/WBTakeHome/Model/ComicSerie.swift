//
//  ComicSerie.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

struct JSONPayload: Codable {
  let data: `Data`
}

struct `Data`: Codable {
  let results: [ComicSerie]
}

struct ComicSerie: Codable {
  let id: Int
  let title: String
  let thumbnail: Thumbnail
  let startYear: Int
  let endYear: Int
  let comics: Comics
}

struct Thumbnail: Codable {
  let path: String
  let `extension`: String
}

struct Comics: Codable {
  let available: Int
}
