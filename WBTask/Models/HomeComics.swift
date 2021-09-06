//
//  HomeComics.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

// MARK: - Welcome
struct HomeComics: Codable {
  let data: Response
}

// MARK: - DataClass
struct Response: Codable {
  let offset, limit, total, count: Int
  let results: [Comics]
}

// MARK: - Result
struct Comics: Codable {
  let id: Int
  let title: String
  let issueNumber: Int
  let description: String?
  let dates: [ComicDate]
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
  let path: String?
  let type: String?

  enum CodingKeys: String, CodingKey {
    case path
    case type = "extension"
  }
}
