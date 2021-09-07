//
//  HomeSeries.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

struct HomeSeries: Codable {
  let data: SeriesResponse
}

struct SeriesResponse: Codable {
  let offset, limit, total, count: Int
  let results: [Series]
}

struct Series: Codable {
  let id: Int
  let title: String
  let startYear, endYear: Int
  let thumbnail: Thumbnail
  let comics: ComicList
}

struct ComicList: Codable {
  let available: Int
}
