//
//  HomeSeries.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

struct SeriesComics: Codable {
  let data: ComicsResponse
}

struct ComicsResponse: Codable {
  let results: [Comics]
}

struct Comics: Codable {
  let id: Int
  let title: String
  let issueNumber: Int
  let thumbnail: Thumbnail
}
